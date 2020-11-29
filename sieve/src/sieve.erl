-module(sieve).

-export([primes/1]).

do_sieve([], Primes) ->
    Primes;
do_sieve([Prime | Range], Primes) ->
    NewRange = lists:filter(fun(X) -> X rem Prime =/= 0 end, Range),
    do_sieve(NewRange, [Prime | Primes]).

primes(Limit) ->
    Range = lists:seq(2, Limit),
    do_sieve(Range, []).
