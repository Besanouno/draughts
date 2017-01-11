-module(functions).
-compile([export_all]).

getOpponent(Figure) ->
    case Figure of 
        "w" -> "b";
        "b" -> "w"
    end.

getPlayerFigure(Player) ->
    case Player of
        -1 -> "w";
        1 -> "b"
    end.