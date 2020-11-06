-module(run_length_encoding).

-export([decode/1, encode/1]).

do_decode([A | T], Acc, []) when ( A >= $1 ) and (A =< $9) ->
    do_decode(T, Acc, [A]);
do_decode([A | T], Acc, Ct) when ( A >= $0 ) and (A =< $9) ->
    do_decode(T, Acc, Ct ++ [A]);
do_decode([A | T], Acc, Ct) ->
    IntCt = case Ct of
                [] -> 1;
                StrCt -> list_to_integer(StrCt)
                end,
    do_decode(T, [lists:duplicate(IntCt, A) | Acc], []);
do_decode([], Acc, _Ct) ->
    string:reverse(Acc).

decode(String) ->
    do_decode(String, [], []).

do_encode([A, A | T], Acc, Ct) ->
    do_encode([A | T], Acc, Ct + 1);
do_encode([A | T], Acc, 1) ->
    do_encode(T, [A | Acc], 1);
do_encode([A | T], Acc, Ct) ->
    do_encode(T, [A, string:reverse(integer_to_list(Ct)) | Acc], 1);
do_encode([], Acc, _Ct) ->
    string:reverse(Acc).

encode(String) ->
    do_encode(String, [], 1).

