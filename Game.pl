:- include('Board.pl').

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
    setPiece(1, BoardNo, Board, DLine, DColumn, NextBoard),
    setPiece(0, BoardNo, NextBoard, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard),
    write('Done!').
