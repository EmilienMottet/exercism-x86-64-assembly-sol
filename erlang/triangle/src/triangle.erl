-module(triangle).

-export([kind/3]).


kind(A, B, C) when A =< 0 orelse B =< 0 orelse C =< 0 ->
    {error, "all side lengths must be positive"};
kind(A, B, C) when A + B =< C orelse A + C =< B orelse B + C =< A ->
    {error, "side lengths violate triangle inequality"};
kind(A, A, A) -> equilateral;
kind(A, _B, A) -> isosceles;
kind(_B, A, A) -> isosceles;
kind(A, A, _B) -> isosceles;
kind(_A, _B, _C) -> scalene.
