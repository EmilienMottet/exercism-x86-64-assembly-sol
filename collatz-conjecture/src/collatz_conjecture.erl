-module(collatz_conjecture).

-export([steps/1]).


steps(1,C) -> C;
steps(N,C) ->
    case (N rem 2)==1 of
        false ->
            steps(round(N/2),C+1);
        true -> steps(round(N*3 + 1),C+1)
    end.
steps(N) when N =< 0 ->
    {error, "Only positive numbers are allowed"};
steps(N) ->
    steps(N,0).
