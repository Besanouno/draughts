-module(move).
-compile([export_all]).
-import(board, [getElement/3]).
-import(board, [setElement/4]).
-import(board, [show/1]).
-import(board, [checkElement/4]).
 
makeMove(Board, Player, [X1, Y1], [X2, Y2]) ->
    PositionsValid = validatePositions(Board, Player, [X1, Y1], [X2,Y2]),
    if PositionsValid ->
        Figure = board:getElement(Board, X1, Y1),
        IsValidStep = isValidStep(Figure, [X1, Y1], [X2, Y2]),
        if IsValidStep -> 
            step(Board, Figure, [X1, Y1], [X2, Y2]);
        true ->
            io:fwrite("BŁĘDNY RUCH!"), io:fwrite("~n"),
            Board
        end;
    true ->
        io:fwrite("BŁĘDNY RUCH!"), io:fwrite("~n"),
        Board
    end.

% private
validatePositions(Board, Player, [X1, Y1], [X2,Y2]) ->
    SimpleValidation = isInsideBounds(X1, Y1) 
                       and isInsideBounds(X2, Y2)
                       and board:checkElement(Board, X2, Y2, "."),
    case Player of 
        1 -> SimpleValidation and (board:checkElement(Board, X1, Y1, "w") or board:checkElement(Board, X1, Y1, "W"));
        -1 -> SimpleValidation and (board:checkElement(Board, X1, Y1, "b") or board:checkElement(Board, X1, Y1, "B")) 
    end. 

% private
isInsideBounds(X,Y) ->
   (X >= 1) and (X =< 8) and (Y >= 1) and (Y =< 8).

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