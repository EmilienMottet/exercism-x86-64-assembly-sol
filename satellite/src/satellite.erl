-module(satellite).

-export([tree_from_traversals/2]).

tree_from_traversals(PreOrder, InOrder) ->
    UPreOrder = lists:usort(PreOrder),
    UInOrder = lists:usort(InOrder),
    if not
           ((length(PreOrder) == length(PreOrder)) and (length(UPreOrder) == length(PreOrder)) and
                (length(UInOrder) == length(InOrder))) ->
           erlang:error("Dupplicate item");
       true ->
           do_tree_from_traversals(PreOrder, InOrder)
    end.

do_tree_from_traversals([], []) ->
    #{};
do_tree_from_traversals([H | T], InOrder) ->
    {L, RT} = take_left(InOrder, H),
    LT = length(T),
    LRT = length(RT),
    #{v => H,
      l => L,
      r => tree_from_traversals(lists:sublist(T, LT + 1 - LRT, LRT), RT)}.

take_left([Target | T], Target) ->
    {#{}, T};
take_left([H | T], Target) ->
    {L, IRT} = take_left(T, Target),
    {#{v => H,
       l => L,
       r => #{}},
     IRT}.
