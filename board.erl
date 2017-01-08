-module(board).
% TODO : wyeksportować tylko niezbędne 
-compile([export_all]).
-define(initBoard, [[".", "W", ".", "W", ".", "W", ".", "W"],
                       ["W", ".", "W", ".", "W", ".", "W", "."],
                       [".", "W", ".", "W", ".", "W", ".", "W"],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       ["B", ".", "B", ".", "B", ".", "B", "."],
                       [".", "B", ".", "B", ".", "B", ".", "B"],
                       ["B", ".", "B", ".", "B", ".", "B", "."]]). 
show() ->
    showBoard(?initBoard).

showBoard([L]) -> showRow(L), io:fwrite("~n");
showBoard([H|T]) ->
    showRow(H), io:fwrite("~n"), showBoard(T).

showRow([L]) -> io:fwrite(L);
showRow([H|T]) ->
        io:fwrite(H), io:fwrite(" "), showRow(T).



    

 
 