-module(beat).
-compile([export_all]).
-import(functions, [getOpponent/1]).
-import(board, [setElement/4]).
-import(board, [areLegalPositions/2]).
-import(board, [areLegalFields/4]).
-import(board, [checkElement/4]).
  

isValidBeat(Board, Figure, [X1, Y1], [X2, Y2]) ->
    Xb = trunc((X1 + X2) / 2),
    Yb = trunc((Y1 + Y2) / 2),

    ((Y2 == Y1 + 2) or (Y2 == Y1 - 2)) and ((X2 == X1 + 2) or (X2 == X1 - 2)) 
    and board:checkElement(Board, Xb, Yb, functions:getOpponent(Figure)). 
    
beat(Board, Figure, [X1, Y1], [X2, Y2]) ->
    Xb = trunc((X1 + X2) / 2),
    Yb = trunc((Y1 + Y2) / 2),
    board:setElement(board:setElement(board:setElement(Board, Xb, Yb,"."), X1, Y1, "."), X2, Y2, Figure).
   
findBeats(Board, X1, Y1) ->
    Figure = board:getElement(Board, X1, Y1), 
    lists:filter(fun([X,Y]) -> board:areLegalPositions([X1, Y1], [X, Y]) and board:areLegalFields(Board, Figure, [X1, Y1], [X, Y]) and isValidBeat(Board, Figure, [X1, Y1], [X, Y]) end, getPossibleBeats(X1, Y1)).
    
getPossibleBeats(X, Y) ->
    [[X-2, Y-2], [X-2, Y+2], [X+2, Y-2], [X+2, Y+2]].