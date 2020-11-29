-module(perfect_numbers).

-export([classify/1]).

test_class(Number,Number) ->
    perfect;
test_class(Number,AliquotSum) when Number < AliquotSum ->
    abundant;
test_class(Number,AliquotSum) when Number > AliquotSum ->
    deficient.


classify(Number) when Number > 2 ->
    Seq = lists:seq(1, ( Number div 2 ) + 1),
    DivisorSeq = [X || X <- Seq, Number rem X == 0],
    AliquotSum = lists:sum(DivisorSeq),
    test_class(Number,AliquotSum);
classify(2) ->
    deficient;
classify(1) ->
    deficient.
