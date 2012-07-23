smallest_element([Head|Tail], Smallest) :-
  smallest_element(Tail, CurrentSmallest),
  min(Head, CurrentSmallest, Smallest).

