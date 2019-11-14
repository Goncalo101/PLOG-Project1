:- include('board.pl').
:- include('menu.pl').

play:-
    initialMenuHandler.

/* Create a Move*/
start :-
    start(Board),
    write('Player with X starts!'), nl,
    write('Passive move'), nl,
    getBoardNumber(BoardNo),
    getOriginCoordinates(OLine, OColumn),
    getDestinationCoordinates(DLine, DColumn),
    setPiece(1, BoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, BoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard),
    write('Done!').

getDestinationCoordinates(DLine, DColumn) :-
    write('Destination coordinates'), nl,
    getDestinationLine(DLine),
    getDestinationColumn(DColumn).

getOriginCoordinates(OLine, OColumn) :-
    write('Origin coordinates'), nl,
    getOriginLine(OLine),
    getOriginColumn(OColumn).
