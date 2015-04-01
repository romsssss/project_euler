-module(problem036).
-compile(export_all).
% -export([solve/0]).

%%%%
% The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
% Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
% (Please note that the palindromic number, in either base, may not include leading zeros.)
%%%%

%% solution = 872187


solve() ->
  lists:sum(double_base_palindrome(1000000)).

double_base_palindrome(Max) ->
  double_base_palindrome(Max, 0, []).

double_base_palindrome(Max, Current, Res) when Current =:= Max -> Res;
double_base_palindrome(Max, Current, Res) ->
  IsPalindromicBase10 = is_palindrome(Current, 10),
  IsPalindromicBase2 = is_palindrome(Current, 2),
  case (IsPalindromicBase10 and IsPalindromicBase2) of
    true -> double_base_palindrome(Max, Current + 1, [Current|Res]);
    false -> double_base_palindrome(Max, Current + 1 , Res)
  end.


is_palindrome(Number, Base) ->
  List = integer_to_list(Number, Base),
  List =:= lists:reverse(List).