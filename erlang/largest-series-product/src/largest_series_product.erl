-module(largest_series_product).

-export([largest_product/2]).

-spec largest_product([$0..$9], non_neg_integer()) -> [$0..$9].
largest_product(_Digits, 0) ->
    1;
largest_product(Digits, Span) when Span > 0 ->
    {L1, L2} = lists:split(Span, Digits),
    do_largest_product(L1, L2, Span, 0).

do_largest_product(List, [], _Span, Max) ->
    Prod = product(List),
    max(Prod, Max);
do_largest_product(List = [_H | T1], [H | T2], Span, Max) ->
    Prod = product(List),
    do_largest_product(T1 ++ [H], T2, Span, max(Prod, Max)).

product(List) ->
    lists:foldl(fun(X, Prod) when (X >= $0) and (X =< $9) -> (X - $0) * Prod end, 1, List).
