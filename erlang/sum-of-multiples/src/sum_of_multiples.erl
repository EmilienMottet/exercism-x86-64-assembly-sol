-module(sum_of_multiples).

-export([sum/2]).

sum(Factors, Limit) ->
    lists:sum(
        lists:usort(
            lists:flatmap(fun (X) when X > 0 ->
                                  lists:seq(0, Limit - 1, X);
                              (_X) ->
                                  []
                          end,
                          Factors))).
