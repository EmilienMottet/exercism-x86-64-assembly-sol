-module(saddle_points).

-export([saddle_points/1, index_max_per_row/1]).

rows(Matrix) ->
    Matrix.

transpose([[] | _]) ->
    [];
transpose(M) ->
    [lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].

columns(Matrix) ->
    transpose(Matrix).

with_index(Matrix) ->
    lists:zip(
        lists:seq(0, length(Matrix) - 1), Matrix).

index_max_per_row(Rows) ->
    sets:from_list(
        lists:flatmap(fun({RIndex, Row}) ->
                         Max = lists:max(Row),
                         lists:map(fun({CIndex, _Value}) -> {RIndex, CIndex} end,
                                   lists:filter(fun({_CIndex, Value}) -> Value == Max end,
                                                with_index(Row)))
                      end,
                      with_index(Rows))).

index_min_per_columns(Columns) ->
    sets:from_list(
        lists:flatmap(fun({CIndex, Column}) ->
                         Min = lists:min(Column),
                         lists:map(fun({RIndex, _Value}) -> {RIndex, CIndex} end,
                                   lists:filter(fun({_RIndex, Value}) -> Value == Min end,
                                                with_index(Column)))
                      end,
                      with_index(Columns))).

saddle_points([[]]) ->
    [];
saddle_points(Matrix) ->
    Rows = rows(Matrix),
    Columns = columns(Matrix),
    sets:to_list(
        sets:intersection(index_max_per_row(Rows), index_min_per_columns(Columns))).
