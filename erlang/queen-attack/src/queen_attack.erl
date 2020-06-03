-module(queen_attack).

-export([can_attack/2]).


can_attack({WQx, WQy}, {BQx, BQy}) ->
    (abs( WQx - BQx ) == abs( WQy - BQy )) or ( WQx == BQx ) or ( WQy == BQy ).
