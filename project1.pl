/* usar nl para newline e predicados psep e pvsep para separadores */

/* §10.22 in sisctus prolog docs: https://sicstus.sics.se/sicstus/docs/latest4/html/sicstus.html/lib_002dlists.html#lib_002dlists */
/* ver nth0, maplist, remove_dups, sumlist, findall, bagof, setof */
/* :- include('file.pl') */
:- use_module(library(lists)).

start:- initBoard(T), transpose(T, Board), display_game(Board, _).

initBoard(T) :-
    append([[[[0,1,0,1], [0,0,0,2], [0,0,0,0], [2,2,0,2]],
            [[1,0,0,0], [0,0,0,0], [0,1,0,2], [2,0,0,0]],
            [[0,0,1,0], [0,0,0,1], [0,0,0,0], [1,0,2,0]],
            [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,2,0,0]]]], T).

translate(0, ' ').
translate(1, 'X').
translate(2, 'O').

printCell(C) :-
    translate(C,P),
    write(P).

printLine([]) :-
    write(' ').

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
    write('|'),
    printBoard(Lines, N1).

printBoards([], 0).
printBoards([Tab|Tabs]) :-
    printBoard(Tab, 4),
    nl,
    printBoards(Tabs).

display_game(Board, Player) :-
    printBoards(Board).


/*
translate(1, 'X').

printCell(C) :-
    translate(C,P),
    write(P).

printLine([]).
printLine([C|L]):-
    printCell(C),
    printLine(L).

printBoard([]).
printBoard([L|T]) :-
    printLine(L),
    printBoard(T).
    */

/* nivel 1 da ia (exemplo) 
findall(X-Y, validMove(Tab, X,Y, NTab), L). */

/* nivel 2 da ia (exemplo)
setof(V-X-Y, (validMove(Tab, X,Y, NTab), eval(NTab, V)), [Play|_]). */