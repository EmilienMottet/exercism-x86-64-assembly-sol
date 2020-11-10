-module(grade_school).

-export([add/3, get/2, get/1, new/0]).
-export_type([school/0]).

-opaque school() :: ID::reference().

add(Name, Grade, School) ->
    put(School, [{Name, Grade} | erlang:get(School)]),
    School.

get(Grade, School) ->
    List = erlang:get(School),
    [Name || {Name, GradeStudent} <- List, GradeStudent == Grade].

get(School) ->
    List = erlang:get(School),
    [Name || {Name, _Grade} <- List].

-spec new() -> school().
new() ->
    A = make_ref(),
    put(A, []),
    A.

