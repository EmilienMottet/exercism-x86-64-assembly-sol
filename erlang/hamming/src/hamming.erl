-module(hamming).

-export([distance/2]).

count_diff(Strand1 , _ ,Ct) when length(Strand1) == 0 -> Ct;
count_diff([A | Strand1] , [B | Strand2],Ct) -> 
    if A == B
        -> count_diff(Strand1,Strand2,Ct) ;
        true -> count_diff(Strand1,Strand2,Ct + 1)
    end.

distance(Strand1, Strand2) when length(Strand1) /= length(Strand2) ->
    {error,"left and right strands must be of equal length"} ;
distance(Strand1, Strand2) -> count_diff(Strand1,Strand2,0).
