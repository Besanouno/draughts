-module(game).
-compile([export_all]).
-import(board,[init/0]).
-import(board,[show/1]).
-import(board,[areLegalPositions/2]).
-import(board,[areLegalFields/4]).
-import(move,[isValidStep/3]).
-import(move,[step/4]).
-import(beat,[isValidBeat/4]).
-import(beat,[beat/4]).
-import(functions,[getPlayerFigure/1]).

play() ->
    start(board:init(), -1).

start(Board, Player) ->
    io:fwrite("________________"),
    io:fwrite("~n"),
    board:show(Board),
    {ok, [X1,Y1]} = io:fread("from : ", "~d,~d"),
    {ok, [X2,Y2]} = io:fread("to : ", "~d,~d").
