-module(all_your_base).

-export([rebase/3]).

to_base(0, _OutputBase, []) ->
    [0];
to_base(0, _OutputBase, Acc) ->
    Acc;
to_base(V, OutputBase, Acc) ->
    to_base(V div OutputBase, OutputBase, [V rem OutputBase | Acc]).

rebase(_Digits, InputBase, _OutputBase) when InputBase < 2 ->
    {error, "input base must be >= 2"};
rebase(_Digits, _InputBase, OutputBase) when OutputBase < 2 ->
    {error, "output base must be >= 2"};
rebase([], _InputBase, _OutputBase) ->
    {ok, [0]};
rebase(Digits, InputBase, OutputBase) ->
    case lists:all(fun(X) -> X < InputBase andalso X >= 0 end, Digits) of
        false ->
            {error, "all digits must satisfy 0 <= d < input base"};
        true ->
            C = lists:foldr(fun({X, I}, Acc) -> Acc + X * trunc(math:pow(InputBase, I)) end,
                            0,
                            lists:zip(
                                lists:reverse(Digits), lists:seq(0, length(Digits) - 1))),
            Res = to_base(C, OutputBase, []),
            {ok, Res}
    end.
