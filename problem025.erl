-module(problem025).
-export([solve/0]).

%%%%
% https://projecteuler.net/problem=25
%%%%

%% solution = 4782


solve() ->
  fib_digits(1000).

fib_digits(NumberDigits) ->
  fib_digits(NumberDigits, 1).

fib_digits(NumberDigits, Current) ->
  FibValDigits = numberDigits(fib(Current)),
  case FibValDigits >= NumberDigits of
    true -> Current;
    false -> fib_digits(NumberDigits, Current+1)
  end.

fib(1) -> 1;
fib(2) -> 1;
fib(N) when N > 2 -> fib1(N,1,1).

fib1(3,P1,P2) -> P1 + P2;
fib1(N,P1,P2) ->
fib1(N-1,P2, P1 + P2).

numberDigits(X) ->
  numberDigits(X, 0).

numberDigits(X, Res) ->
  case X div 10 of
    0 -> Res+1;
    _ -> numberDigits(X div 10, Res+1)
  end.
