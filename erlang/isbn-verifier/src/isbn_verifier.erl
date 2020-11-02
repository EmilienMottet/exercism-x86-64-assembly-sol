-module(isbn_verifier).

-export([is_valid/1]).

clean_isbn_key($X) ->
    10;
clean_isbn_key(X) ->
    X - 48 .

clean_isbn_body(Isbn) ->
    [X - 48 || X <- Isbn, X >= $0, X =< $9].

compute_isbn(Isbn) ->
    Zipped = lists:zipwith(fun(X, Y) -> X * Y end, Isbn, lists:seq(1,10)),
    (lists:sum(Zipped) rem 11) == 0.

isbn_check(Isbn) ->
    [Key | Body] = lists:reverse(Isbn),
    CleanBody = clean_isbn_body(Body),
    CleanKey = clean_isbn_key(Key),
    case [ CleanKey | CleanBody ] of
        CleanIsbn when length(CleanIsbn) == 10 ->
            compute_isbn(CleanIsbn);
        _Else ->
            false
    end.

is_valid(Isbn) when length(Isbn) > 9 ->
    try
        isbn_check(Isbn)
    catch
        _ -> false
    end;
is_valid(_Isbn) ->
    false.
