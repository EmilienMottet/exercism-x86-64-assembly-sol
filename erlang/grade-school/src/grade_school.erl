-module(grade_school).

-export([add/3, get/2, get/1, new/0]).

-export_type([school/0]).

-opaque school() :: ID :: reference().

-spec add(string:t(), integer(), school()) -> school().
add(Name, Grade, School) ->
    School ! {add, {Name, Grade}},
    School.

-spec get(integer(), school()) -> [string:t()].
get(Grade, School) ->
    School ! {get, self(), Grade},
    receive
      List ->
          List
    end.

-spec get(school()) -> [string:t()].
get(School) ->
    School ! {get, self()},
    receive
      List ->
          List
    end.

-spec new() -> school().
new() ->
    spawn(fun () ->
                  loop([])
          end).

loop(School) ->
    receive
      {get, From, Grade} ->
          From ! [Name || {Name, GradeStudent} <- School, GradeStudent == Grade],
          loop(School);
      {get, From} ->
          From ! [Name || {Name, _Grade} <- School],
          loop(School);
      {add, {Name, Grade}} ->
          loop([{Name, Grade} | School])
    end.

