-module(parallel_letter_frequency).

-export([dict/1]).

freq(Str) when is_list(Str) ->
    {ok, lists:foldr(fun(X, Acc) -> dict:update_counter(X, 1, Acc) end, dict:new(), Str)}.

dict(Strings) ->
    S = self(),
    process_flag(trap_exit, true),
    Pids = [spawn_link(fun() -> S ! freq(Str) end) || Str <- Strings],
    lists:foldr(fun(D, Acc) -> dict:merge(fun(_Key, V1, V2) -> V1 + V2 end, D, Acc) end,
                dict:new(),
                lists:map(fun(Pid) -> loop(Pid) end, Pids)).

loop(Pid) ->
    receive
        {ok, D} ->
            D;
        {'EXIT', _Pid, normal} ->
            loop(Pid);
        {'EXIT', _FromPid, _Reason} ->
            dict:new()
    end.
