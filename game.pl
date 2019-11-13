:- include('board.pl').
:- include('menu.pl').

/* Create a Move*/
play:-
    start(Board),
    write('Player with X starts!'), nl,
    write('Passive move'), nl,
    getBoardNumber(BoardNo),
    write('Origin coordinates'), nl,
    getOriginLine(OLine),
    getOriginColumn(OColumn), nl,
    write('Destiny coordinates'), nl,
    getDestinyLine(DLine),
    getDestinyColumn(DColumn),
    setPiece(1, BoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, BoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard),
    write('Done!').

start :-
    initialMenuHandler.