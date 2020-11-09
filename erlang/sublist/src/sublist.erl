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
is_sublist(L1 = [H | _T], L2) ->
    DroppedList = lists:dropwhile(fun (X) when X =/= H ->
                                          true;
                                      (_) ->
                                          false
                                  end,
                                  L2),
    case DroppedList of
      [_ | T] ->
          is_equal(L1, lists:sublist(DroppedList, length(L1))) or is_sublist(L1, T);
      [] ->
          false
    end.

is_superlist(L1, L2) ->
    is_sublist(L2, L1).

is_unequal(L1, L1) ->
    false;
is_unequal(_L1, _L2) ->
    true.

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
