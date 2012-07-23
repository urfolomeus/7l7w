reverse_list([], []).
reverse_list([Head|Tail], ReversedList) :-
  reverse_list(Tail, Memo),
  append(Memo, [Head], ReversedList).

