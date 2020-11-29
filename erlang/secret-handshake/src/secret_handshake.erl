-module(secret_handshake).

-export([commands/1]).


commands(Number) ->
    M = [ { 1 , "wink" }, { 2 , "double blink" }, { 4 , "close your eyes" }, { 8 , "jump" } ],
    Res = lists:filtermap(fun({K, Text}) ->
                                  case (K band Number ) == K of
                                      true -> { true , Text };
                                      false -> false
                                  end
                          end, M),
    if
        16 band Number == 16 ->
            lists:reverse(Res) ;
        true ->
            Res
    end.
