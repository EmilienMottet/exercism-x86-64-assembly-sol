-module(change).

-export([find_fewest_coins/2]).

do_generate(_Coins, _Target, Possibilities, _Acc) when map_size(Possibilities) == 0 ->
    undefined;
do_generate(Coins, Target, Possibilities, []) ->
    NewPossibilities =
        maps:from_list(
            lists:flatmap(fun({Total, Possibility}) ->
                             lists:flatmap(fun (Coin) when Total + Coin =< Target ->
                                                   [{Total + Coin, [Coin | Possibility]}];
                                               (_Coin) -> []
                                           end,
                                           Coins)
                          end,
                          maps:to_list(Possibilities))),
    do_generate(Coins, Target, NewPossibilities, maps:get(Target, NewPossibilities, []));
do_generate(_Coins, _Target, _Possibilities, Acc) ->
    lists:sort(Acc).

find_fewest_coins(0, _Coins) ->
    [];
find_fewest_coins(Target, Coins) when Target > 0 ->
    SortedCoins = lists:sort(Coins),
    MappedCoins = lists:map(fun(X) -> {X, [X]} end, SortedCoins),
    Possibilities = maps:from_list(MappedCoins),
    do_generate(Coins, Target, Possibilities, maps:get(Target, Possibilities, [])).
