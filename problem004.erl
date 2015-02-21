-module(problem004).
-export([solve/0]).

%%%%
% A palindromic number reads the same both ways.
% The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
% Find the largest palindrome made from the product of two 3-digit numbers.
%%%%

%% solution = 906609

solve() ->
  lists:max(palindromes()).

is_integer_palindrome(X) ->
  integer_to_list(X) =:= lists:reverse(integer_to_list(X)).

palindromes() ->
  palindromes(0, 0, []).

palindromes(999, 999, Palindromes) -> Palindromes;
palindromes(F1, 999, Palindromes) ->
  palindromes(F1+1, 0, Palindromes);
palindromes(F1, F2, Palindromes) ->
  case is_integer_palindrome(F1*F2) of
    true -> palindromes(F1, F2+1, [F1*F2|Palindromes]); % palindrome
    false -> palindromes(F1, F2+1, Palindromes) % no palindrome
  end.

