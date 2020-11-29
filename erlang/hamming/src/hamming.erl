-module(hamming).

-export([distance/2]).

count_diff([], [] ,Ct) -> Ct;
count_diff([A | Strand1] , [A | Strand2],Ct) ->
    count_diff(Strand1,Strand2,Ct) ;
count_diff([_ | Strand1] , [_ | Strand2],Ct) ->
    count_diff(Strand1,Strand2,Ct + 1)
    .

distance(Strand1, Strand2) when length(Strand1) /= length(Strand2) ->
    {error,"left and right strands must be of equal length"} ;
distance(Strand1, Strand2) -> count_diff(Strand1,Strand2,0).
