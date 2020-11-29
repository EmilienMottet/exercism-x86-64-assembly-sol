-module(series).

-export([slices/2]).

slices(_,[]) ->
    erlang:error("empty series");
slices(SliceLength,Series) when (SliceLength =< 0) orelse (length(Series) < SliceLength) ->
    erlang:error("bad SliceLength");
slices(SliceLength, Series) ->
    [ lists:sublist(Series,Index,SliceLength) || Index <- lists:seq(1,length(Series) - SliceLength + 1)].

