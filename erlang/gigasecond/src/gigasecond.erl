-module(gigasecond).

%% -import(calendar,[datetime_to_gregorian_seconds/1,gregorian_seconds_to_datetime/1]).

-export([from/1]).


from(_From = {Y,D,M}) ->
    from({{Y,D,M},{0,0,0}});
from(From = {{_Y,_D,_Mo},{_H,_Mi,_S}}) ->
    DateInSeconds = calendar:datetime_to_gregorian_seconds(From),
    NewDateInSeconds = DateInSeconds + 1000000000,
    calendar:gregorian_seconds_to_datetime(NewDateInSeconds).

