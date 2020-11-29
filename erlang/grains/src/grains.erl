-module(grains).

-export([square/1, total/0]).

square(Square) when (Square =< 64) and (Square >= 1) ->
    trunc(math:pow(2, Square - 1));
square(_) ->
    {error, "square must be between 1 and 64"}.

total() ->
    lists:sum(
      lists:map(fun square/1, lists:seq(1, 64))).
