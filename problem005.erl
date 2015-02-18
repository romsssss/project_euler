-module(problem005).
-export([solve/0]).

%%%%
% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any
% remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
%%%%

%% solution = 232792560

solve() ->
  Divisors = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
  smallest_divisible_by(Divisors, 300000000).

smallest_divisible_by(List, Max) ->
  smallest_divisible_by(List, Max, 1).

smallest_divisible_by(_, Max, Current) when Current > Max ->
  io:format("Not found in (0..~B) range~n", [Max]);
smallest_divisible_by(List, Max, Current) ->
  case divisible_by(Current, List) of
    true -> Current;
    false -> smallest_divisible_by(List, Max, Current+1)
  end.

divisible_by(_, []) -> true;
divisible_by(X, [Head|_]) when X rem Head =/= 0 -> false;
divisible_by(X, [_|Tail]) ->
  divisible_by(X, Tail).