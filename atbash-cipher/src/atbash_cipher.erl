-module(atbash_cipher).

-export([decode/1, encode/1]).


decode(Phrase) -> 
    [ permute(X) || X <- Phrase, X /= $\s].

clean_phrase(Phrase) ->
    DownPhrase = string:lowercase(Phrase),
    [ X || X <- DownPhrase, (( X >= $a ) and ( X =< $z )) or ((X >= $0) and ( X =< $9)) ].

add_space([], _, Acc) ->
    Acc;
add_space([ Head | []], 4, Acc) ->
    add_space([],0,[Head | Acc]);
add_space([ Head | Tail], 4, Acc) ->
    add_space(Tail,0,[" ", Head | Acc]);
add_space([Head | Tail], Ct, Acc) ->
    add_space(Tail,Ct + 1, [Head | Acc]).

permute(X) when ( X >= $a ) and ( X =< $z )->
    $z - (X - $a);
permute(X) ->
    X.


encode(Phrase) ->
    CleanPhrase = clean_phrase(Phrase),
    string:reverse(add_space([permute(X) || X <- CleanPhrase],0,[])).
