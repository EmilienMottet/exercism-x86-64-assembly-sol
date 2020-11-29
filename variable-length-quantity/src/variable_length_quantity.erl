-module(variable_length_quantity).

-export([encode/1, decode/1]).

encode(Integers) ->
    lists:flatten([encode_byte(to_base(Bytes, 128, []), []) || Bytes <- Integers]).

decode([Integer]) when Integer > 127 ->
    undefined;
decode(Integers) ->
    lists:flatten([from_base(decode_byte(lists:reverse(I), []), 128)
                   || I <- split_variable(Integers, [[]])]).

from_base(Digits, InputBase) ->
    to_base(lists:foldr(fun({X, I}, Acc) -> Acc + X * trunc(math:pow(InputBase, I)) end,
                        0,
                        lists:zip(
                            lists:reverse(Digits), lists:seq(0, length(Digits) - 1))),
            4294967296,
            []).

split_variable([], [[] | Acc]) ->
    lists:reverse(Acc);
split_variable([H | T1], [Acc | TAcc]) when H < 128 ->
    split_variable(T1, [[], lists:reverse([H | Acc]) | TAcc]);
split_variable([H | T1], [Acc | TAcc]) ->
    split_variable(T1, [[H | Acc] | TAcc]).

decode_byte([], Acc) ->
    Acc;
decode_byte([H | T], []) ->
    decode_byte(T, [H]);
decode_byte([H | T], Acc) ->
    decode_byte(T, [H band 127 | Acc]).

encode_byte([B], Acc) ->
    lists:reverse([B | Acc]);
encode_byte([H | T], Acc) ->
    encode_byte(T, [H bor (1 bsl 7) | Acc]).

to_base(0, _OutputBase, []) ->
    [0];
to_base(0, _OutputBase, Acc) ->
    Acc;
to_base(V, OutputBase, Acc) ->
    to_base(V div OutputBase, OutputBase, [V rem OutputBase | Acc]).
