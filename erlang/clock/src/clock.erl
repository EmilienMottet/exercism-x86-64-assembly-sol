-module(clock).

-export([create/2, is_equal/2, minutes_add/2, to_string/1, mod/2]).

create(Hour, Minute) ->
    Minutes = Hour * 60 + Minute,
    {mod(floor(Minutes / 60) rem 24, 24), mod(Minutes rem 60, 60)}.

is_equal(Clock1, Clock1) ->
    true;
is_equal(_Clock1, _Clock2) ->
    false.

minutes_add({H, M}, Minutes) ->
    create(H, M + Minutes).

to_string({Hour, Minute}) ->
    print_hour(Hour) ++ ":" ++ print_minute(Minute).

print_hour(Hour) when Hour < 10 ->
    "0" ++ integer_to_list(Hour);
print_hour(Hour) ->
    integer_to_list(Hour).

print_minute(Minute) when Minute < 10 ->
    "0" ++ integer_to_list(Minute);
print_minute(Minute) ->
    integer_to_list(Minute).

mod(X, Y) when X > 0 ->
    X rem Y;
mod(X, Y) when X < 0 ->
    Y + X rem Y;
mod(0, _Y) ->
    0.

