-module(diamond).

-export([rows/1]).

%% A = 65
space_out(L,Size) -> [L | lists:duplicate(Size, $\s)] ++ [L].

outer(Size) ->
    lists:duplicate(Size, $\s).

row($A,Width) ->
    Outer = outer(Width div 2),
    [ Outer ++ "A" ++ Outer ];
row(L, Width) ->
    Size = (L - 1 - $A) * 2 + 1,
    Outer = outer(( Width - Size - 2 ) div 2),
    Middle = space_out(L,Size),
    [ Outer ++ Middle ++ Outer ].

gen_rows($A , Width ) ->
    row($A,Width);
gen_rows(L, Width) ->
    gen_rows(L-1, Width) ++ row(L,Width).

rows("A") ->
    [ "A" ];
rows([L]) ->
    Width = (L - $A) * 2 + 1,
    First = gen_rows(L-1,Width), 
    First ++ row(L,Width) ++ lists:reverse(First).
