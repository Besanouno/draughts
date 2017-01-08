-module(board). 
-export([show/0]).
-define(initBoard, [[".", "W", ".", "W", ".", "W", ".", "W"],
                       ["W", ".", "W", ".", "W", ".", "W", "."],
                       [".", "W", ".", "W", ".", "W", ".", "W"],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       [".", ".", ".", ".", ".", ".", ".", "."],
                       ["B", ".", "B", ".", "B", ".", "B", "."],
                       [".", "B", ".", "B", ".", "B", ".", "B"],
                       ["B", ".", "B", ".", "B", ".", "B", "."]]).
% public 
show() ->
    showBoard(?initBoard).

% private 
showBoard([L]) -> showRow(L), io:fwrite("~n");
showBoard([H|T]) ->
    showRow(H), io:fwrite("~n"), showBoard(T).

% private
showRow([L]) -> io:fwrite(L);
showRow([H|T]) ->
        io:fwrite(H), io:fwrite(" "), showRow(T).



    

 
 