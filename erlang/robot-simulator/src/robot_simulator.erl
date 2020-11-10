-module(robot_simulator).

-export([advance/1, create/0, direction/1, left/1, place/3, position/1, right/1]).

advance(Robot) ->
    Map = #{north => {0, 1}, east => {1, 0}, south => {0, -1}, west => {-1, 0}},
    Direction = direction(Robot),
    {Xa, Ya} = position(Robot),
    {Xb, Yb} = maps:get(Direction, Map),
    put(Robot, {Direction, {Xa + Xb, Ya + Yb}}).

create() ->
    spawn(fun () ->
                  loop({undefined, {undefined, undefined}})
          end).

direction(Robot) ->
    {Direction, _Position} = get(Robot),
    Direction.

left(Robot) ->
    Map = #{north => west, east => north, south => east, west => south},
    Direction = direction(Robot),
    put(Robot, {maps:get(Direction, Map), position(Robot)}).

place(Robot, Direction, Position) ->
    put(Robot, {Direction, Position}).

position(Robot) ->
    {_Direction, Position} = get(Robot),
    Position.

right(Robot) ->
    Map = #{north => east, east => south, south => west, west => north},
    Direction = direction(Robot),
    put(Robot, {maps:get(Direction, Map), position(Robot)}).

