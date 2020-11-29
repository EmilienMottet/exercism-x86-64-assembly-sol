-module(bob).

-export([response/1]).


yelling("") -> false;
yelling(S) ->
    (string:to_upper(S) == S) and not (string:to_lower(S) == S).

question("") -> false;
question(S) ->
    lists:last(S) == $?.

response(String) ->
    Trimed = string:trim(String),
    Yelling = yelling(Trimed),
    Question = question(Trimed),
    if
        Question andalso Yelling-> "Calm down, I know what I'm doing!";
        Question -> "Sure.";
        Yelling -> "Whoa, chill out!";
        Trimed == "" -> "Fine. Be that way!";
        true -> "Whatever."
    end
        .
