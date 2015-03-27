-module(problem030).
-export([solve/0]).

%%%%
% https://projecteuler.net/problem=30
%%%%

%% solution = 443839


solve() ->
  Power = 5,
  Upper_limit = (Power + 1) * math:pow(9, Power),
  Results = digit_powers(Power, trunc(Upper_limit), []),
  lists:sum(Results).


digit_powers(_, 1, Res) -> Res;

digit_powers(Power, Current, Res) ->
  Sum = sum_digit_power(Current, Power),
  case Sum == Current of
    true -> digit_powers(Power, Current - 1, [Current|Res]);
    false -> digit_powers(Power, Current -1 , Res)
  end.


sum_digit_power(X, Power) ->
  sum_digit_power(X, Power, 0.0).

sum_digit_power(Current, _, Res) when Current =:= 0 -> Res;
sum_digit_power(Current, Power, Res) ->
  Digit = Current rem 10,
  Rest = Current div 10,
  sum_digit_power(Rest, Power, Res + math:pow(Digit, Power)).