:- include('Board.pl').

/* Create a Move*/
play:-
    start,
    write('Player with X starts!'), nl,
    write('Passive move'), nl,
    getBoardNumber,
    write('Origin coordinates'), nl,
    getOriginLine,
    getOriginColumn,
    write('Destiny coordinates'), nl,
    getDestinyLine,
    getDestinyColumn,
    
    write('Done!'), nl.