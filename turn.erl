-module(move).
-compile([export_all]).
-import(board, [validatePositions/4]).
-import(move, [isValidStep/4]).

makeMove(Board, Player, [X1, Y1], [X2, Y2]) ->
    Figure = board:getElement(Board, X1, Y1), 
    PositionsValid = board:validatePositions(Board, Figure, [X1, Y1], [X2,Y2]),
    if PositionsValid ->
        IsValidStep = move:isValidStep(Board, Player, [X1, Y1], [X2, Y2]);
    true ->
        io:fwrite("BŁĘDNY RUCH!"), io:fwrite("~n"),
        Board
    end.