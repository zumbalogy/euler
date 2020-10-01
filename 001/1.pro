% The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
% The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.

% NOTE: skipping "append" (https://www.swi-prolog.org/pldoc/man?predicate=append/3) for this exersize.
% NOTE: skipping more arithmetic solution for this exersize.

:- initialization euler, nl, halt.

mods(A, B) :- 0 is mod(A, B).

valid(X) :- (mods(X, 3); mods(X, 5)).

range(X, X, [X]) :- !.
range(X, Y, [X|Xs]) :-
  X =< Y,
  Z is X+1,
  range(Z, Y, Xs).

filter([X], [X]) :- valid(X).
filter([_], []).
filter([H|T], Acc) :-
  filter([H], Head),
  filter(T, Rest),
  append(Head, Rest, Acc).

sum([], 0).
sum([H|T], Acc) :-
  sum(T, Rest),
  Acc is H + Rest.

euler :-
  range(1, 999, All),
  filter(All, Res),
  sum(Res, Total),
  print(Total).

% 233168
