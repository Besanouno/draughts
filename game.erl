-module(game).
-compile([export_all]).
-import(board,[show/1]).
-import(board,[init/0]).

play() ->
    start(board:init(), 1).

start(Board, Player) ->
    io:fwrite("________________"),
    board:show(Board),
    {ok, [X1,Y1]} = io:fread("from : ", "~d,~d"),
    {ok, [X2,Y2]} = io:fread("to : ", "~d,~d"),
    start(move:makeMove(Board, Player, [X1, Y1], [X2, Y2]), Player * (-1)).

