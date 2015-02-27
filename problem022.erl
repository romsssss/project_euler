-module(problem022).
-export([solve/0]).

%%%%
% https://projecteuler.net/problem=22
%%%%

%% solution = 871198282


solve() ->
  {ok, Binary} = file:read_file("./problem022.txt"),
  List = string:tokens(binary_to_list(Binary), "\",\\\""),
  SortedList = lists:sort(List),
  calculateScore(SortedList).

calculateScore(List) ->
  calculateScore(List, 0, 1).

calculateScore([], Score, _) -> Score;
calculateScore([Head|Tail], Score, Position) ->
  calculateScore(Tail, Score+(Position*score(Head)), Position+1).

score(Word) ->
  score(Word, 0).

score([], Sum) -> Sum;
score([Head|Tail], Sum) ->
  score(Tail, Sum+alphabeticalPosition(Head)).

alphabeticalPosition(Letter) ->
  Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  string:chr(Alphabet, Letter).
