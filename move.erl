-module(move).
-compile([export_all]). 
-import(board, [setElement/4]).
-import(board, [isLegalMove/1]).
-import(board, [checkElement/4]).
  
% private
isValidStep(Figure, [X1, Y1], [X2, Y2]) ->
    if (Y2 == Y1 + 1) or (Y2 == Y1 - 1) ->
        case Figure of 
            "w" -> X2 == X1 + 1; 
            "b" -> X2 == X1 - 1
        end;
    true -> %% else 
        false 
    end.

step(Board, Figure, [X1, Y1], [X2, Y2]) ->
    board:setElement(board:setElement(Board, X1, Y1, "."), X2, Y2, Figure).
 
findSteps(Board, X1, Y1) ->
    Figure = board:getElement(Board, X1, Y1), 
    lists:filter(fun([X,Y]) -> board:isLegalMove(Board, Figure, [X1, Y1], [X, Y]) and isValidStep(Board, [X1, Y1], [X, Y]) end, getPossibleSteps(X1, Y1)).
    
getPossibleSteps(X, Y) ->
    [[X-1, Y-1], [X-1, Y+1], [X+1, Y-1], [X+1, Y+1]].
