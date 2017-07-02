% module Data.Int
-module(data_int@foreign).
-export([fromNumberImpl/1, toNumber/1, fromStringAsImpl/1, toStringAs/1, pow/2]).

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

fromStringAsImpl(Just) ->
  fun (Nothing) ->
    fun (Radix) ->
      fun (S) ->
        try Just(list_to_integer(S, Radix)) catch error:badarg -> Nothing end
      end
    end
  end.

toStringAs(Radix) ->
  fun (I) ->
    integer_to_list(I, Radix)
  end.

pow(X,Y) -> trunc(math:pow(X,Y)).