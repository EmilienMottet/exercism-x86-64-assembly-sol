-module(space_age).

-export([age/2]).


age(neptune, Seconds) ->
    Seconds / ( 164.79132 * 365.25 * 24 * 60 * 60)  ;
age(uranus, Seconds) ->
    Seconds / ( 84.016846 * 365.25 * 24 * 60 * 60)  ;
age(saturn, Seconds) ->
    Seconds / ( 29.447498 * 365.25 * 24 * 60 * 60)  ;
age(jupiter, Seconds) ->
    Seconds / ( 11.862615 * 365.25 * 24 * 60 * 60)  ;
age(mars, Seconds) ->
    Seconds / ( 1.8808158 * 365.25 * 24 * 60 * 60)  ;
age(venus, Seconds) ->
    Seconds / ( 0.61519726 * 365.25 * 24 * 60 * 60)  ;
age(mercury, Seconds) ->
    Seconds / ( 0.2408467 * 365.25 * 24 * 60 * 60)  ;
age(earth, Seconds) ->
    Seconds / (1 * 365.25 * 24 * 60 * 60).
