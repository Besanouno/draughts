-module(move).
-compile([export_all]).
-import(board, [getElement/3]).
-import(board, [setElement/4]).
-import(board, [show/1]).
-import(board, [isThereThisFigure/4]).
 
       % IsValidMove = isValidStep(Figure, [X1, Y1], [X2, Y2]),
      %  IsValidBeat = isValidBeat(Board, Figure, [X1, Y1], [X2, Y2]),
      %  CorrectInitConditions and (IsValidBeat or IsValidMove); 


% public
makeMove(Board, Figure, [X1, Y1], [X2, Y2]) -> 
    if (validatePositions(Board, Figure, [X1, Y1], [X2, Y2])) ->   
        board:show( step(Board, Figure, [X1, Y1], [X2, Y2]) );
    true -> %% else
        io:fwrite("BŁĘDNY RUCH!"), io:fwrite("~n"),
        board:show(Board)
    end. 

validatePositions(Board, Figure, [X1, Y1], [X2, Y2]) ->
    isInsideBounds(X1,Y1) 
    and isInsideBounds(X2,Y2) 
    and (board:getElement(Board, X1, Y1) == Figure) 
    and (board:getElement(Board, X2, Y2) == ".").
      
% private
isValidStep(Figure, [X1, Y1], [X2, Y2]) -> 
    if ((X2 == X1 + 1) or (X2 == X1-1)) -> 
        case Figure of 
            "w" -> Y2 == Y1 + 1; 
            "b" -> Y2 == Y1 - 1
        end;
    true -> %% else 
        false 
    end.

% private
isValidBeat(Board, Figure, [X1, Y1], [X2, Y2]) -> 
    if ((X2 == X1 + 2) or (X2 == X1 - 2)) -> 
        case Figure of 
            "w" -> (Y2 == Y1 + 2) and board:isThereThisFigure(Board, (X1 + X2) / 2, (Y1 + Y2) / 2, "b"); 
            "b" -> (Y2 == Y1 - 2) and board:isThereThisFigure(Board, (X1 + X2) / 2, (Y1 + Y2) / 2, "w")
        end;
    true -> %% else 
        false 
    end.  


step(Board, Figure, [X1, Y1], [X2, Y2]) ->
    board:setElement(board:setElement(Board, X1, Y1, "."), X2, Y2, Figure).

beat(Board, Figure, [X1, Y1], [X2, Y2]) ->
    case Figure of 
        "w" -> board:setElement(board:setElement(board:setElement(Board, X1, Y1, "."), X2, Y2, Figure), (X1 + X2) / 2, (Y1 + Y2) / 2, ".");
        "b" -> board:setElement(board:setElement(board:setElement()))
    end.

% private
isInsideBounds(X,Y) ->
   (X >= 1) and (X =< 8) and (Y >= 1) and (Y =< 8).