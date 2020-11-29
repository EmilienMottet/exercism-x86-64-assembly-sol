-module(complex_numbers).

-export([abs/1, add/2, conjugate/1, divide/2, equal/2, exp/1, imaginary/1, mul/2, new/2,
         real/1, sub/2]).

-export_type([complex/0, real/0, imaginary/0]).

-opaque complex() :: {real(), imaginary()}.
-opaque real() :: number().
-opaque imaginary() :: number().

-spec abs(complex()) -> complex().
abs({R, I}) ->
    trunc(math:pow(math:pow(R, 2) + math:pow(I, 2), 0.5)).

-spec add(complex(), complex()) -> complex().
add({R1, I1}, {R2, I2}) ->
    {R1 + R2, I1 + I2}.

-spec conjugate(complex()) -> complex().
conjugate({R, I}) ->
    {R, -I}.

-spec divide(complex(), complex()) -> complex().
divide({R1, I1}, {R2, I2}) ->
    {(R1 * R2 + I1 * I2) / (math:pow(R2, 2) + math:pow(I2, 2)),
     (I1 * R2 - R1 * I2) / (math:pow(R2, 2) + math:pow(I2, 2))}.

-spec equal(complex(), complex()) -> boolean().
equal({R1, I1}, {R2, I2}) ->
    erlang:abs(R1 - R2) < 0.005 andalso erlang:abs(I1 - I2) < 0.005.

-spec exp(complex()) -> complex().
exp({R, I}) ->
    mul({math:exp(R), 0}, {math:cos(I), math:sin(I)}).

-spec imaginary(complex()) -> imaginary().
imaginary({_R, I}) ->
    I.

-spec mul(complex(), complex()) -> complex().
mul({R1, I1}, {R2, I2}) ->
    {R1 * R2 - I1 * I2, I1 * R2 + R1 * I2}.

-spec new(real(), imaginary()) -> complex().
new(R, I) ->
    {R, I}.

-spec real(complex()) -> real().
real({R, _I}) ->
    R.

-spec sub(complex(), complex()) -> complex().
sub({R1, I1}, {R2, I2}) ->
    {R1 - R2, I1 - I2}.
