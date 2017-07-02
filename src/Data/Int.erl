-module(data_int@foreign).
-export([fromNumberImpl/3,toNumber/1,fromStringAsImpl/4,toStringAs/2,pow/2]).

fromNumberImpl(Just, Nothing, N) ->
  case trunc(N) of
    N1 when N1 == N -> Just(N1);
    _ -> Nothing
  end.

toNumber(N) -> float(N).

fromStringAsImpl(Just,Nothing,Radix,S) ->
  try Just(list_to_integer(S, Radix)) catch error:badarg -> Nothing end.

toStringAs(Radix,I) -> integer_to_list(I, Radix).

pow(X,Y) -> trunc(math:pow(X,Y)).
