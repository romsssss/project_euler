-module(problem006).
-export([solve/0]).

%%%%
% https://projecteuler.net/problem=6
%%%%

%% solution = 25164150


solve() ->
  square_of_sums(100) - sum_of_squares(100).

sum_of_squares(X) ->
  sum_of_squares(X, 0).

sum_of_squares(0, Acc) -> Acc;
sum_of_squares(X, Acc) ->
  sum_of_squares(X-1, Acc+math:pow(X, 2)).

square_of_sums(X) ->
  square_of_sums(X, 0).

square_of_sums(0, Acc) -> math:pow(Acc, 2);
square_of_sums(X, Acc) ->
  square_of_sums(X-1, Acc+X).