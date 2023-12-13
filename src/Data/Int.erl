-module(data_int@foreign).
-export([fromNumberImpl/3,toNumber/1,fromStringAsImpl/4,toStringAs/2,pow/2,quot/2,'rem'/2]).

fromNumberImpl(Just, Nothing, N) when is_float(N) ->
  %% this uses only float ops that should be trivial and exact
  Abs = abs(N),
  AbsFloor = math:floor(Abs),
  if AbsFloor =:= Abs, Abs =< 9.007199254740991e15 -> Just(trunc(N));
     true -> Nothing
  end.

toNumber(N) -> float(N).

fromStringAsImpl(Just,Nothing,Radix,S) ->
  try Just(binary_to_integer(S, Radix)) catch error:badarg -> Nothing end.

toStringAs(Radix,I) -> integer_to_binary(I, Radix).

pow(X,Y) -> trunc(math:pow(X,Y)).

quot(X, Y) -> X div Y.

'rem'(X, Y) -> X rem Y.
