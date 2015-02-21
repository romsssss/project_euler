-module(problem010).
-export([solve/0]).

%%%%
% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
% Find the sum of all the primes below two million.
%%%%

%% solution = 142913828922


solve() ->
  sum_primes(2000000).

sum_primes(Until) ->
  sum_primes(Until, 0, 0).

sum_primes(Until, Current, Sum) when Current > Until ->
  Sum;
sum_primes(Until, Current, Sum) ->
  case is_prime(Current) of
    true -> sum_primes(Until, Current+1, Sum+Current);
    false -> sum_primes(Until, Current+1, Sum)
  end.

% Trivial division algorithm
is_prime(X) when X =:= 2 -> true; % 2 is the only even prime number
is_prime(X) when X rem 2 =:= 0 -> false; % even number
is_prime(X) ->
  is_prime(X, ceiling(math:sqrt(X))).

is_prime(_, 2) -> true;
is_prime(X, Current) when X rem Current =:= 0 -> false;
is_prime(X, Current) -> is_prime(X, Current-1).


ceiling(X) when X < 0 ->
  trunc(X);
ceiling(X) ->
  T = trunc(X),
  case X - T == 0 of
    true -> T;
    false -> T + 1
  end.