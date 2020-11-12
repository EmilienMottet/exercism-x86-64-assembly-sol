-module(parallel_letter_frequency).

-export([dict/1]).

freq(Str) ->
    lists:foldr(fun(X, Acc) -> dict:update_counter(X, 1, Acc) end, dict:new(), Str).

dict(Strings) ->
    Pid = spawn(fun() -> loop(dict:new()) end),
    lists:foreach(fun(Str) -> Pid ! Str end, Strings),
    Pid ! {get, self()},
    receive
        D ->
            D
    end.

loop(D) ->
    receive
        {get, From} ->
            From ! D;
        String ->
            ND = dict:merge(fun(_Key, V1, V2) -> V1 + V2 end, D, freq(String)),
            loop(ND)
    end.
