-module(word_count).

-export([count_words/1]).

count_words(Sentence) ->
    {match, WordList} = re:run(string:lowercase(Sentence),
                               "[\\w]+[']*[\\w]*\\b",
                               [unicode, global, {capture, all, list}]),
    CleanWordList = lists:append(WordList),
    lists:foldr(fun (Word, Map) ->
                        maps:put(Word, maps:get(Word, Map, 0) + 1, Map)
                end,
                maps:new(),
                CleanWordList).

