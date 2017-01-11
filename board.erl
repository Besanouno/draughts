-module(board).
-compile([export_all]).
-import(functions, [getOpponent/1]).
-define(initBoard, [[".", "w", ".", "w", ".", "w", ".", "w"],
                       ["w", ".", "w", ".", "w", ".", "w", "."],
                       [".", "w", ".", "w", ".", "w", ".", "w"],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       ["b", ".", "b", ".", "b", ".", "b", "."],
                       [".", "b", ".", "b", ".", "b", ".", "b"],
                       ["b", ".", "b", ".", "b", ".", "b", "."]]). 

%% ZAWSZE PODAJEMY NAJPIERW WIERSZ MNE A POTEM KOLUMNE %%
 
show([L]) -> showRow(L), io:fwrite("~n");
show([H|T]) ->
    showRow(H), io:fwrite("~n"), show(T).
 
getElement(Board, X, Y) ->
    lists:nth(Y, lists:nth(X,Board)).
 
setElement(Board, X, Y, Figure) ->
    lists:sublist(Board, X-1) ++ [setElementInRow(lists:nth(X, Board), Y, Figure)] ++ lists:nthtail(X, Board).
 
checkElement(Board, X, Y, Figure) ->
    getElement(Board, X, Y) == Figure.
 
init() -> ?initBoard.
 
showRow([L]) -> io:fwrite(L);
showRow([H|T]) ->
        io:fwrite(H), io:fwrite(" "), showRow(T).
 
setElementInRow(R, N, Figure) ->
    lists:sublist(R, N-1) ++ [Figure] ++ lists:nthtail(N, R).
 
isFree(Board, X, Y) ->
    checkElement(Board, X, Y, ".").

areLegalPositions([X1, Y1], [X2, Y2]) ->
    isInsideBounds(X1, Y1) 
    and isInsideBounds(X2, Y2).

areLegalFields(Board, Figure, [X1, Y1], [X2,Y2]) ->
    board:checkElement(Board, X2, Y2, ".") 
    and board:checkElement(Board, X1, Y1, Figure). 

isInsideBounds(X,Y) ->
   (X >= 1) and (X =< 8) and (Y >= 1) and (Y =< 8).

 
 