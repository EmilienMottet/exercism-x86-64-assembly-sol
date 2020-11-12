-module(roman_numerals).

-export([roman/1]).

do_roman(0, Acc) ->
    Acc;
do_roman(Number, Acc) when Number >= 1000 ->
    do_roman(Number - 1000, Acc ++ "M");
do_roman(Number, Acc) when Number >= 900 ->
    do_roman(Number - 900, Acc ++ "CM");
do_roman(Number, Acc) when Number >= 500 ->
    do_roman(Number - 500, Acc ++ "D");
do_roman(Number, Acc) when Number >= 400 ->
    do_roman(Number - 400, Acc ++ "CD");
do_roman(Number, Acc) when Number >= 100 ->
    do_roman(Number - 100, Acc ++ "C");
do_roman(Number, Acc) when Number >= 90 ->
    do_roman(Number - 90, Acc ++ "XC");
do_roman(Number, Acc) when Number >= 50 ->
    do_roman(Number - 50, Acc ++ "L");
do_roman(Number, Acc) when Number >= 40 ->
    do_roman(Number - 40, Acc ++ "XL");
do_roman(Number, Acc) when Number >= 10 ->
    do_roman(Number - 10, Acc ++ "X");
do_roman(9, Acc) ->
    do_roman(0, Acc ++ "IX");
do_roman(Number, Acc) when Number >= 5 ->
    do_roman(Number - 5, Acc ++ "V");
do_roman(4, Acc) ->
    do_roman(0, Acc ++ "IV");
do_roman(Number, Acc) ->
    do_roman(Number - 1, Acc ++ "I").

roman(Number) ->
    do_roman(Number, []).

