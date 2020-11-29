-module(rational_numbers).

-export([absolute/1, add/2, divide/2, exp/2, mul/2, reduce/1, sub/2]).

-export_type([rational/0]).

-opaque rational() :: {integer(),integer()}.

-spec absolute(rational()) -> rational().
absolute({A, B}) when B < 0 ->
    absolute({A, -B});
absolute({A, B}) when A < 0 ->
    absolute({-A, B});
absolute({A, B}) ->
    {A, B}.

-spec add(rational(),rational()) -> rational().
add({A1, B1}, {A2, B2}) ->
    reduce({A1 * B2 + A2 * B1, B1 * B2}).

-spec divide(rational(),rational()) -> rational().
divide({A1, B1}, {A2, B2}) ->
    reduce({A1 * B2, A2 * B1}).

-spec exp(rational() | float(),rational() | float()) -> rational() | float().
exp({A, B}, Exponent) when is_float(Exponent) ->
    math:pow(A, Exponent) / math:pow(B, Exponent);
exp({A, B}, Exponent) when Exponent < 0 ->
    exp({B, A}, -Exponent);
exp({A, B}, Exponent) ->
    {trunc(math:pow(A, Exponent)), trunc(math:pow(B, Exponent))};
exp(X, {A, B}) ->
    math:pow(
        math:pow(X, A), 1 / B).

-spec mul(rational(),rational()) -> rational().
mul({A1, B1}, {A2, B2}) ->
    reduce({A1 * A2, B1 * B2}).

-spec reduce(rational()) -> rational().
reduce(R = {A, B}) when (A < 0) and (B < 0) ->
    reduce(absolute(R));
reduce(R = {A, B}) when (A < 0) or (B < 0) ->
    {NA, NB} = reduce(absolute(R)),
    {-NA, NB};
reduce(R = {A, B}) ->
    reduce(R, min(A, B)).

reduce(R, 1) ->
    R;
reduce({_A, 0}, 0) ->
    {1, 0};
reduce({0, _B}, 0) ->
    {0, 1};
reduce({A, B}, D) when (A div D == A / D) and (B div D == B / D) ->
    NA = A div D,
    NB = B div D,
    reduce({NA, NB}, min(NA, NB));
reduce(R, D) ->
    reduce(R, D - 1).

-spec sub(rational(),rational()) -> rational().
sub({A1, B1}, {A2, B2}) ->
    reduce({A1 * B2 - A2 * B1, B1 * B2}).
