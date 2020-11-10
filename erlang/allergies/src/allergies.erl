-module(allergies).

-export([allergies/1, is_allergic_to/2]).

map_item() ->
    #{eggs => 1,
      peanuts => 2,
      shellfish => 4,
      strawberries => 8,
      tomatoes => 16,
      chocolate => 32,
      pollen => 64,
      cats => 128}.

allergies(Score) ->
    maps:keys(maps:filter(fun (K, _V) ->
                                  is_allergic_to(K, Score)
                          end,
                          map_item())).

is_allergic_to(Substance, Score) ->
    Value = maps:get(Substance, map_item()),
    Score band Value =:= Value.

