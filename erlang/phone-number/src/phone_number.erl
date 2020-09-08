-module(phone_number).

-export([number/1, areacode/1, pretty_print/1]).

number(String) ->
  clean_number(String).

clean_number(String) ->
    valid_number([ X || X <- String, X >= $0, X =< $9 ]).

valid_number(String = [ First | Tail]) when ( First == $1 ) and (length(String) == 11) ->
    Tail;
valid_number(String = [ First | _Tail]) when ( First /= $1 ) or (length(String) /= 10) ->
    "0000000000";
valid_number(String) ->
    String.

areacode(String) ->
  string:slice(String,0,3).

pretty_print(String = [First | Tail]) when ( First == $1 ) and (length(String) == 11) ->
    pretty_print(Tail);
pretty_print(String) when length(String) == 10 ->
    "(" ++ areacode(String) ++ ") " ++ string:slice(String,3,3) ++ "-" ++ string:slice(String,6,4).
