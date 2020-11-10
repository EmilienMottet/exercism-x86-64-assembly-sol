-module(robot_simulator).

-export([advance/1, create/0, direction/1, left/1, place/3, position/1, right/1]).

advance(Robot) ->
    Robot ! advance,
    Robot.

create() ->
    spawn(fun () ->
                  loop({undefined, {undefined, undefined}})
          end).

direction(Robot) ->
    Robot ! {direction, self()},
    receive
      Direction ->
          Direction
    end.

left(Robot) ->
    Robot ! left,
    Robot.

place(Robot, Direction, Position) ->
    Robot ! {place, {Direction, Position}},
    Robot.

position(Robot) ->
    Robot ! {position, self()},
    receive
      Position ->
          Position
    end.

right(Robot) ->
    Robot ! right,
    Robot.

loop(Robot = {Direction, Position = {X, Y}}) ->
    receive
      {place, {NewDirection, {Xnew, Ynew}}} ->
          loop({NewDirection, {Xnew, Ynew}});
      {position, From} ->
          From ! Position,
          loop(Robot);
      {direction, From} ->
          From ! Direction,
          loop(Robot);
      left ->
          Map = #{north => west, east => north, south => east, west => south},
          loop({maps:get(Direction, Map), Position});
      right ->
          Map = #{north => east, east => south, south => west, west => north},
          loop({maps:get(Direction, Map), Position});
      advance ->
          Map = #{north => {0, 1}, east => {1, 0}, south => {0, -1}, west => {-1, 0}},
          {Xb, Yb} = maps:get(Direction, Map),
          loop({Direction, {X + Xb, Y + Yb}})
    end.

