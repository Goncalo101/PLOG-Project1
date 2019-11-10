:- use_module(library(lists)).

start:- initBoard(T), transpose(T, Board), display_game(Board, _).

initBoard(T) :-
    append([[
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]],
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]],
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]],
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]]]], T).

translate(0, ' ').
translate(1, 'X').
translate(2, 'O').

printCell(C) :-
    translate(C,P),
    write(' '),
    write(P),
    write(' ').

printLine([]) :-
    write(' | ').

printLine([C|L]):-
    printCell(C),
    printLine(L).

printSep(0).
printSep(1).
printSep(2) :- write(' '), write('|'), write(' ').
printSep(3).
printSep(4).

printBoard([], 0).
printBoard([Line|Lines], N) :-
    N > 0,
    N1 is N - 1,
    printSep(N),
    printLine(Line),
    printBoard(Lines, N1).

printBoards([]).
printBoards([Tab|Tabs]) :-
    write('| '),
    printBoard(Tab, 4),
    nl, 
    printBoards(Tabs).

display_game(Board, Player) :-
    write(' -------------- --------------    -------------- -------------- '), nl,
    printBoards(Board),
    write(' -------------- --------------    -------------- -------------- ').
