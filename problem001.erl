-module(problem001).
-export([solve/0]).

%%%%
% If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
% The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.
%%%%

%% solution = 233168

solve() ->
  lists:sum(lists:filter(fun(X) -> multiple_of_3_or_5(X) end, lists:seq(1,999))).

multiple_of_3_or_5(X) ->
  (X rem 3 == 0) or (X rem 5 == 0).

