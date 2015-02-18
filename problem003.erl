-module(problem003).
-export([solve/0]).

%%%%
% The prime factors of 13195 are 5, 7, 13 and 29.
% What is the largest prime factor of the number 600851475143 ?
%%%%

%% solution = 6857

solve() ->
  lists:max(prime_factors(600851475143)).

prime_factors(X) ->
  prime_factors(X, 2, []).

prime_factors(1, _, Factors) -> Factors;
prime_factors(X, K, Factors) when X rem K == 0 ->
  prime_factors(X div K, K, [K|Factors]);
prime_factors(X, K, Factors) ->
  prime_factors(X, K+1, Factors).