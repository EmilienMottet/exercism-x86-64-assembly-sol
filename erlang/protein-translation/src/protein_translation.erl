-module(protein_translation).

-export([proteins/1]).

do_proteins([$U, $C, $A | T], Acc) ->
    do_proteins(T, [serine | Acc]);
do_proteins([$U, $C, $G | T], Acc) ->
    do_proteins(T, [serine | Acc]);
do_proteins([$U, $C, $C | T], Acc) ->
    do_proteins(T, [serine | Acc]);
do_proteins([$U, $C, $U | T], Acc) ->
    do_proteins(T, [serine | Acc]);
do_proteins([$U, $A, $A | _T], Acc) ->
    do_proteins([], Acc);
do_proteins([$U, $A, $G | _T], Acc) ->
    do_proteins([], Acc);
do_proteins([$U, $G, $A | _T], Acc) ->
    do_proteins([], Acc);
do_proteins([$U, $U, $A | T], Acc) ->
    do_proteins(T, [leucine | Acc]);
do_proteins([$U, $U, $G | T], Acc) ->
    do_proteins(T, [leucine | Acc]);
do_proteins([$U, $G, $G | T], Acc) ->
    do_proteins(T, [tryptophan | Acc]);
do_proteins([$U, $G, $C | T], Acc) ->
    do_proteins(T, [cysteine | Acc]);
do_proteins([$U, $G, $U | T], Acc) ->
    do_proteins(T, [cysteine | Acc]);
do_proteins([$U, $A, $C | T], Acc) ->
    do_proteins(T, [tyrosine | Acc]);
do_proteins([$U, $A, $U | T], Acc) ->
    do_proteins(T, [tyrosine | Acc]);
do_proteins([$U, $U, $C | T], Acc) ->
    do_proteins(T, [phenylalanine | Acc]);
do_proteins([$U, $U, $U | T], Acc) ->
    do_proteins(T, [phenylalanine | Acc]);
do_proteins([$A, $U, $G | T], Acc) ->
    do_proteins(T, [methionine | Acc]);
do_proteins([], Acc) ->
    lists:reverse(Acc).

proteins(String) ->
    do_proteins(String, []).

