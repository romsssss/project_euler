-module(problem016).
-export([solve/0]).

%%%%
% 2ˆ15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
% What is the sum of the digits of the number 2ˆ1000?
%%%%

%% solution = 1366

solve() ->
  sum_digits(trunc(math:pow(2, 1000))).

sum_digits(X) ->
  sum_digits(X, 0).

sum_digits(X, Res) when X =:= 0 -> Res;
sum_digits(X, Res) ->
  sum_digits(X div 10, Res + X rem 10).