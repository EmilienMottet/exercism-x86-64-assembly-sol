-module(transpose).

-export([transpose/1, do_column/2, do_zip/3]).

do_column([], Acc) ->
    Acc;
do_column([H | T], Acc) ->
    do_column(T, Acc ++ [[H]]).

do_zip([], [], Acc) ->
    lists:reverse(Acc);
do_zip([H1 | T1], [], Acc) ->
    do_zip(T1, [], [H1 | Acc]);
do_zip([], [H2 | T2], Acc) ->
    do_zip([], T2, [H2 | Acc]);
do_zip([H1 | T1], [H2 | T2], Acc) ->
    do_zip(T1, T2, [H1 ++ H2 | Acc]).

do_transpose([], Acc) ->
    Acc;
do_transpose([L | T], Acc) ->
    do_transpose(T, do_zip(Acc, do_column(L, []), [])).

transpose([]) ->
    [];
transpose(Lines) ->
    {[H | T], _Acc} =
        lists:mapfoldr(fun(X, Acc) ->
                          LenX = max(length(X), Acc),
                          {string:left(X, LenX), LenX}
                       end,
                       length(lists:last(Lines)),
                       Lines),
    do_transpose(T, do_column(H, [])).
