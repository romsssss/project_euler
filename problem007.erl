-module(problem007).
-export([solve/0]).

%%%%
% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
% What is the 10 001st prime number?
%%%%

%% solution = 104743


solve() ->
  lists:last(prime_list(10001)).

prime_list(Length) ->
  prime_list(Length, 0, []).

prime_list(Length, _, List) when length(List) =:= Length ->
  lists:reverse(List);
prime_list(Length, Current, List) ->
  case is_prime(Current) of
    true -> prime_list(Length, Current+1, [Current|List]);
    false -> prime_list(Length, Current+1, List)
  end.

% Trivial and unefficient implementation of primability check
is_prime(X) ->
  is_prime(X, X-1).

is_prime(_, 1) -> true;
is_prime(X, Current) when X rem Current =:= 0 -> false;
is_prime(X, Current) -> is_prime(X, Current-1).