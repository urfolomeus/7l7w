% I was trying to do an accumulative syle sort
% because I didn't know how to split the list up
% for a binary sort.
%
% Anyhoo, I got hopelessly stuck and then googled
% it to find this
%
% http://ktiml.mff.cuni.cz/~bartak/prolog/sorting.html
%
bubble_sort(List, Sorted) :-
  b_sort(List, [], Sorted).

b_sort([], Acc, Acc).
b_sort([H|T], Acc, Sorted) :-
  bubble(H, T, NewT, Max),
  b_sort(NewT, [Max|Acc], Sorted).

bubble(X, [], [], X).

bubble(X, [Y|T], [Y|NewT], Max) :-
  X > Y,
  bubble(X, T, NewT, Max).

bubble(X, [Y|T], [X|NewT], Max) :-
  X =< Y,
  bubble(Y, T, NewT, Max).

