-module(series).

-export([slices/2,test_version/0]).


slices(SliceLength, Series) ->
    [ lists:sublist(Series,Index,SliceLength) || Index <- lists:seq(1,length(Series) - SliceLength + 1)].

test_version() ->
    1.
