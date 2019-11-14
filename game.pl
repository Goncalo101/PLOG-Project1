:- include('board.pl').
:- include('menu.pl').

/* Create a Move*/
play:-
    initialMenuHandler.

start :-
    start(Board),
    write('Player with X starts!'), nl,
    write('Passive move'), nl,
    getBoardNumber(BoardNo),
    write('Origin coordinates'), nl,
    getOriginLine(OLine),
    getOriginColumn(OColumn), nl,
    write('Destination coordinates'), nl,
    getDestinationLine(DLine),
    getDestinationColumn(DColumn),
    setPiece(1, BoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, BoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard),
    write('Done!').