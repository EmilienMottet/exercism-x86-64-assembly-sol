-module(isbn_verifier).

-export([is_valid/1]).

clean_isbn_key(Isbn) ->
    [case X of $X -> 10; X -> X - 48 end || X <- Isbn, ( ( X >= $0 ) and ( X =< $9 ) ) or (X == $X)].

clean_isbn_body(Isbn) ->
    [case X of $X -> 10; X -> X - 48 end || X <- Isbn, ( ( X >= $0 ) and ( X =< $9 ) )].

compute_isbn(Isbn) ->
    Zipped = lists:zipwith(fun(X, Y) -> X * Y end, Isbn, lists:seq(10,1,-1)),
    (lists:sum(Zipped) rem 11) == 0.

is_valid(Isbn) when length(Isbn) > 9 ->
    Body = clean_isbn_body(lists:sublist(Isbn,length(Isbn) -1)),
    Key = clean_isbn_key(lists:sublist(Isbn,length(Isbn), 1)),
    case Body ++ Key of
        CleanIsbn when length(CleanIsbn) == 10 ->
            compute_isbn(CleanIsbn);
        _Else ->
            false
        end;
is_valid(_Isbn) ->
    false.
