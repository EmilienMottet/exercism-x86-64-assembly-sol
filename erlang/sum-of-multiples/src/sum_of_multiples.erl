-module(sum_of_multiples).

-export([sum/2]).

sum(Factors, Limit) ->
    lists:sum(
      lists:usort(
        lists:flatmap(
          fun (X) -> lists:seq(0,Limit,X) end, Factors)
       )
     ).
