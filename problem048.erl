-module(problem048).
-export([solve/0]).


%%%%
% https://projecteuler.net/problem=48
%%%%

%% solution = 9110846700


solve() ->
  Digits = 10,
  Res = integer_to_list(power_sum(1000)),
  lists:sublist(Res, length(Res)-Digits+1, Digits).

power_sum(Max) ->
  power_sum(Max, 1, 0).

power_sum(Max, Current, Res) when Current > Max -> Res;
power_sum(Max, Current, Res) ->
  power_sum(Max, Current + 1, Res + pow(Current, Current)).


pow(X, N) when is_integer(N), N >= 0 -> pow(X, N, 1).
pow(_, 0, P) -> P;
pow(X, N, A) -> pow(X, N-1, A*X).
