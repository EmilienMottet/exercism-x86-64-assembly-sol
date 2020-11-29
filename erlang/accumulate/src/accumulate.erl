-module(accumulate).

-export([accumulate/2]).


accumulate(Fn, Ls) ->
  [Fn(Elt) || Elt <- Ls].
