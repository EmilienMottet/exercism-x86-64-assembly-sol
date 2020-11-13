-module(parallel_letter_frequency).

-export([dict/1]).

freq(Str) ->
    lists:foldr(fun(X, Acc) -> dict:update_counter(X, 1, Acc) end, dict:new(), Str).

dict(Strings) ->
    S = self(),
    Pids = [spawn(fun() -> S ! {self(), freq(Str)} end) || Str <- Strings],
    lists:foldr(fun(D, Acc) -> dict:merge(fun(_Key, V1, V2) -> V1 + V2 end, D, Acc) end,
                dict:new(),
                lists:map(fun(Pid) -> receive {Pid, D} -> D end end, Pids)).
