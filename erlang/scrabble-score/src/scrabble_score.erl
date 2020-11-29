-module(scrabble_score).

-export([score/1]).

do_score([$A | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$E | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$I | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$O | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$U | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$L | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$N | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$R | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$S | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$T | T], Acc) ->
    do_score(T, Acc + 1);
do_score([$D | T], Acc) ->
    do_score(T, Acc + 2);
do_score([$G | T], Acc) ->
    do_score(T, Acc + 2);
do_score([$B | T], Acc) ->
    do_score(T, Acc + 3);
do_score([$C | T], Acc) ->
    do_score(T, Acc + 3);
do_score([$M | T], Acc) ->
    do_score(T, Acc + 3);
do_score([$P | T], Acc) ->
    do_score(T, Acc + 3);
do_score([$F | T], Acc) ->
    do_score(T, Acc + 4);
do_score([$H | T], Acc) ->
    do_score(T, Acc + 4);
do_score([$V | T], Acc) ->
    do_score(T, Acc + 4);
do_score([$W | T], Acc) ->
    do_score(T, Acc + 4);
do_score([$Y | T], Acc) ->
    do_score(T, Acc + 4);
do_score([$K | T], Acc) ->
    do_score(T, Acc + 5);
do_score([$J | T], Acc) ->
    do_score(T, Acc + 8);
do_score([$X | T], Acc) ->
    do_score(T, Acc + 8);
do_score([$Q | T], Acc) ->
    do_score(T, Acc + 10);
do_score([$Z | T], Acc) ->
    do_score(T, Acc + 10);
do_score([], Acc) ->
    Acc.

score(Word) ->
    do_score(string:uppercase(Word), 0).

