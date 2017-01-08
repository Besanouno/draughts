-module(functions).
-compile([export_all]).
-define(initialBoardArrangement, ".b.b.b.b\nb.b.b.b.\n.b.b.b.b\n........\n........\nw.w.w.w.\n.w.w.w.w\nw.w.w.w.").

show() ->
    io:format("~p ~n", [?initialBoardArrangement]).