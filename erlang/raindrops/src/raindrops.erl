-module(raindrops).

-export([convert/1]).


convert(Number,_ , Done) when ((Number rem 3) == 0) and ((Done rem 3) /= 0) ->
    convert(Number div 3,"Pling", Done * 3);
convert(Number,Res, Done) when ((Number rem 5) == 0) and ((Done rem 5) /= 0) ->
    convert(Number div 5,string:concat(Res,"Plang"), Done * 5);
convert(Number,Res, Done) when ((Number rem 7) == 0) and ((Done rem 7) /= 0) ->
    convert(Number div 7,string:concat(Res,"Plong"),Done * 7);
convert(Number,"", _) -> integer_to_list(Number);
convert(_,Res, _) -> Res.
convert(Number) ->
    convert(Number,"", 1).
