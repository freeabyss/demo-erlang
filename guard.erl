-module(guard).
-export([guard_test/1]).

guard_test(X) when is_integer(X) -> X;
guard_test(X) -> X*2.