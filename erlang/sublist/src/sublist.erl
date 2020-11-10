-module(sublist).

-export([is_equal/2, is_sublist/2, is_superlist/2, is_unequal/2, relation/2]).

is_equal(L1, L1) ->
    true;
is_equal(_L1, _L2) ->
    false.

is_sublist(L1, L2) when length(L2) < length(L1) ->
    false;
is_sublist([], _L2) ->
    true;
is_sublist(L1 = [H | T1], [H | T2]) ->
    is_ordered_sublist(T1, T2) orelse is_sublist(L1, T2);
is_sublist(L1, [_H | T2]) ->
    is_sublist(L1, T2).

is_ordered_sublist(L1, L2) when length(L2) < length(L1) ->
    false;
is_ordered_sublist([], _L2) ->
    true;
is_ordered_sublist([H | T1], [H | T2]) ->
    is_ordered_sublist(T1, T2);
is_ordered_sublist(_L1, _L2) ->
    false.

is_superlist(L1, L2) ->
    is_sublist(L2, L1).

is_unequal(L1, L2) ->
    not is_equal(L1, L2).

relation(L1, L2) ->
    case {is_equal(L1, L2), is_sublist(L1, L2), is_superlist(L1, L2), is_unequal(L1, L2)} of
      {true, _, _, false} ->
          equal;
      {false, true, _, true} ->
          sublist;
      {false, false, true, true} ->
          superlist;
      {false, false, false, true} ->
          unequal
    end.

