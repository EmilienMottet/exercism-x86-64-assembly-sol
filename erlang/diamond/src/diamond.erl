-module(diamond).

-export([rows/1]).

%% A = 65
rows_demi([65]) -> [[32,65,32]];
rows_demi([L]) -> lists:map(fun (X) -> [32] ++ X ++ [32] end,rows_demi([L-1])) ++ [[32,L] ++ lists:map(fun (_) -> 32  end,lists:seq(0, (L - 1 - 65) * 2)) ++ [L,32] ].


rows([65]) ->
    [[65]];
rows([L]) ->
    rows_demi([L - 1]) ++ [[L] ++ lists:map(fun (_) -> 32  end,lists:seq(0, (L - 1 - 65) * 2)) ++ [L] ] ++ lists:reverse(rows_demi([L - 1])).
