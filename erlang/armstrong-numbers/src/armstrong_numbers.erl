-module(armstrong_numbers).

-export([is_armstrong_number/1]).

power_number([],_Exp,Acc) ->
    Acc;
power_number([Head | Tail],Exp,Acc) ->
    Digit = list_to_integer([Head]),
    Power = trunc(math:pow(Digit,Exp)),
    power_number(Tail,Exp,[Power | Acc]).

is_armstrong_number(Number, Number) ->
    true;
is_armstrong_number(_Number, _Sum) ->
    false.

is_armstrong_number(Number) ->
    NumberList = integer_to_list(Number),
    PowerList = power_number(NumberList,length(NumberList),[]),
    is_armstrong_number(Number,lists:sum(PowerList)).
