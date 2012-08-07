-module(ch1).
-export([word_count/1]).

word_count([]) -> 0;
word_count(X)  ->
  [Head|Tail] = X,
  case Head of
    32 -> word_count(Tail);
    _  -> word_counter(X, 1)
  end.

followed_by_letter([])       -> false;
followed_by_letter([Head|_]) ->
  case Head of
    32 -> false;
    _  -> true
  end.

word_counter([], N)          -> N;
word_counter([Head|Tail], N) ->
  case Head of
    32 ->
      case followed_by_letter(Tail) of
        false -> word_counter(Tail, N);
        true  -> word_counter(Tail, N+1)
      end;
    _  -> word_counter(Tail, N)
  end.

