:- include('Board.pl').

/* Create a Move*/
play:-
    start,
    write('Player with X starts!'), nl,
    write('Passive move'), nl,
    getBoardNumber(Board),
    write('Origin coordinates'), nl,
    getOriginLine(OLine),
    getOriginColumn(OColumn), nl,
    write('Destiny coordinates'), nl,
    getDestinyLine(DLine),
    getDestinyColumn(DColumn),
    Aux is DLine - OLine,
    write(Aux), nl,
    write('Done!'), nl.