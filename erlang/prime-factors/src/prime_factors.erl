-module(prime_factors).

-export([factors/1]).

factors(Target,[Candidate | Candidates ],Acc) when Target rem Candidate == 0 ->
    factors(Target div Candidate,[Candidate | Candidates ],[ Candidate | Acc]);
factors(Target,[_Candidate | Candidates],Acc) ->
    factors(Target,Candidates,Acc);
factors(1,[],Acc) ->
    Acc;
factors(Target,[],Acc) ->
    [Target | Acc ].

factors(Value) when Value > 1 ->
    Seq = lists:seq(2, trunc(math:sqrt(Value)) + 1),
    factors(Value,Seq,[]);
factors(1) ->
    [].

