-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).

add(Elem,Set)  ->
    case contains(Elem,Set) of
        true -> Set;
        false -> Set ++ [Elem]
    end.

contains(Elem, Set) ->
    lists:member(Elem, Set).

difference(Set1, Set2) ->
    [E || E <- Set1 , not contains(E,Set2)].

disjoint(Set1, Set2) ->
    lists:all(fun (X) -> not contains(X,Set2)  end, Set1).

empty(Set) when length(Set)==0 -> true;
empty(_Set) -> false.

equal(Set1, Set2) ->
    lists:usort(Set1) == lists:usort(Set2).

from_list(List) ->
    lists:usort(List).

intersection(Set1, Set2) ->
    [E || E <- Set2 , contains(E,Set1) ].

subset(Set1, Set2) ->
    lists:all(fun (X) -> contains(X,Set2)  end, Set1).

union(Set1, Set2) ->
    lists:foldl(fun(X, Set) -> add(X,Set) end, Set1, Set2).
