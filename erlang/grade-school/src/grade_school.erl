-module(grade_school).

-export([add/3, get/2, get/1, new/0]).

add(Name, Grade, School) ->
    [{Name, Grade} | School].

get(Grade, School) ->
    [Name || {Name, GradeStudent} <- School, GradeStudent == Grade].

get(School) ->
    [Name || {Name, _Grade} <- School].

new() ->
    [].

