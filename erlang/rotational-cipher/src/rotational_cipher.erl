-module(rotational_cipher).

-export([decrypt/2, encrypt/2]).

decrypt(String, Key) ->
    [decrypt_char(C, Key) || C <- String].

encrypt(String, Key) ->
    [encrypt_char(C, Key) || C <- String].

decrypt_char(C, Key) when (C >= $a) and (C =< $z) ->
    ($z - $a + 1 + C - $a - Key) rem ($z - $a + 1) + $a;
decrypt_char(C, Key) when (C >= $A) and (C =< $Z) ->
    ($Z - $A + 1 + C - $A - Key) rem ($Z - $A + 1) + $A;
decrypt_char(C, _Key) ->
    C.

encrypt_char(C, Key) when (C >= $a) and (C =< $z) ->
    ($z - $a + 1 + C - $a + Key) rem ($z - $a + 1) + $a;
encrypt_char(C, Key) when (C >= $A) and (C =< $Z) ->
    ($Z - $A + 1 + C - $A + Key) rem ($Z - $A + 1) + $A;
encrypt_char(C, _Key) ->
    C.
