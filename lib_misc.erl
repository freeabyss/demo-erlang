-module(lib_misc).
-export([for/3,qsort/1,pythag/1,odds_and_evens/1, odds_and_evens_acc/1]).

for(Max, Max, F)    -> [F(Max)];
for(I, Max, F)      -> [F(I) | for(I+1, Max, F)].

%% 快速排序
qsort([])   -> [];
qsort([Pivot|T])    ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

%% 生成毕达哥拉斯三元组

pythag(N) ->
    [{A,B,C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(1, N),
        C <- lists:seq(1, N),
        A+B+C =< N,
        A*A + B*B =:= C*C
    ].
%% 分解为偶数序列和奇数序列

odds_and_evens(L) ->
    Odds = [X || X <- L, (X rem 2) =:= 1],
    Evens =[X || X <- L, (X rem 2) =:= 0],
    {Odds, Evens}.

%% odds_and_evens 优化

odds_and_evens_acc(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of 
        0 -> odds_and_evens_acc(T, Odds, [H|Evens]);
        1 -> odds_and_evens_acc(T, [H|Odds], Evens)
    end;
odds_and_evens_acc([], Odds, Evens) ->
    {Odds, Evens}.