-module(board).
-compile([export_all]).
-define(initBoard, [[".", "w", ".", "w", ".", "w", ".", "w"],
                       ["w", ".", "w", ".", "w", ".", "w", "."],
                       [".", "w", ".", "w", ".", "w", ".", "w"],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       ["b", ".", "b", ".", "b", ".", "b", "."],
                       [".", "b", ".", "b", ".", "b", ".", "b"],
                       ["b", ".", "b", ".", "b", ".", "b", "."]]). 

%% ZAWSZE PODAJEMY NAJPIERW WIERSZ MNE A POTEM KOLUMNE %%

% public
show([L]) -> showRow(L), io:fwrite("~n");
show([H|T]) ->
    showRow(H), io:fwrite("~n"), show(T).

% public 
getElement(Board, X, Y) ->
    lists:nth(Y, lists:nth(X,Board)).

% public
setElement(Board, X, Y, Figure) ->
    lists:sublist(Board, X-1) ++ [setElementInRow(lists:nth(X, Board), Y, Figure)] ++ lists:nthtail(X, Board).

% public
checkElement(Board, X, Y, Figure) ->
    getElement(Board, X, Y) == Figure.

% public
init() -> ?initBoard.

% public 

% private
showRow([L]) -> io:fwrite(L);
showRow([H|T]) ->
        io:fwrite(H), io:fwrite(" "), showRow(T).

% private
setElementInRow(R, N, Figure) ->
    lists:sublist(R, N-1) ++ [Figure] ++ lists:nthtail(N, R).


    

 
 