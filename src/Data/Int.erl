% module Data.Int
-module(data_int@foreign).
-export([fromNumberImpl/1, toNumber/1, fromStringImpl/1]).

fromNumberImpl(Just) ->
  fun (Nothing) ->
    fun (N) ->
      case trunc(N) of
        N1 when N1 == N -> Just(N1);
        _ -> Nothing
      end
    end
  end.

toNumber(N) -> float(N).

fromStringImpl(Just) ->
  fun (Nothing) ->
    fun (S) ->
      try Just(list_to_integer(S)) catch error:badarg -> Nothing end
    end
  end.
