-module(difference_of_squares).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).


difference_of_squares(Number) ->
    square_of_sum(Number) - sum_of_squares(Number).

sum(0) -> 0;

sum(N) ->
    N + sum(N-1).

square_of_sum(Number) ->
    S = sum(Number),
    S*S.

sum_of_squares(0) -> 0;

sum_of_squares(Number) ->
    Number * Number + sum_of_squares(Number - 1 ).
