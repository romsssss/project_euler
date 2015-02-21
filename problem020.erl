-module(problem020).
-export([solve/0]).

%%%%
% n! means n × (n − 1) × ... × 3 × 2 × 1

% For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
% and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

% Find the sum of the digits in the number 100!
%%%%

%% solution = 648


solve() ->
  sum_digits(fact(100)).

fact(X) ->
  fact(X, 1).

fact(1, Res) -> Res;
fact(X, Res) ->
  fact(X-1, Res*X).

sum_digits(X) ->
  sum_digits(X, 0).

sum_digits(X, Res) when X =:= 0 -> Res;
sum_digits(X, Res) ->
  sum_digits(X div 10, Res + X rem 10).