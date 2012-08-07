-module(ch2).
-export([get/2]).

print(X) -> io:format("~p~n", [X]).

get(Key, List) ->