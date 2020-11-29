-module(nth_prime).

-export([prime/1, is_prime/1]).

is_prime(2) ->
    true;
is_prime(N) when (N < 2) or (N rem 2 == 0) ->
    false;
is_prime(N) ->
    is_prime(N, 3).

is_prime(N, K) when N < K * K ->
    true;
is_prime(N, K) when N rem K == 0 ->
    false;
is_prime(N, K) ->
    is_prime(N, K + 2).

do_prime(N, N, Res) ->
    Res - 1;
do_prime(N, Ct, It) ->
    case is_prime(It) of
        true ->
            do_prime(N, Ct + 1, It + 1);
        false ->
            do_prime(N, Ct, It + 1)
    end.

prime(N) when N > 0 ->
    do_prime(N, 1, 3).
