-module(anagram).

-export([find_anagrams/2]).


find_anagrams(Subject, Candidates) -> 
    lists:filter(fun (X) -> 
                         (lists:sort(string:lowercase(X)) == lists:sort(string:lowercase(Subject)))
                             and
                         (string:lowercase(X) /= string:lowercase(Subject))
                 end
              ,Candidates).
