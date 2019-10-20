/* usar nl para newline e predicados psep e pvsep para separadores */

/* §10.22 in sisctus prolog docs: https://sicstus.sics.se/sicstus/docs/latest4/html/sicstus.html/lib_002dlists.html#lib_002dlists */
/* ver nth0, maplist, remove_dups, sumlist, findall, bagof, setof */
/* :- include('file.pl') */
:- use_module(library(lists)).

start:- initBoard(T), printBoard(T).

initBoard(T) :-
    append([[
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]],
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]],
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]],
        [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]]]], T).
    /*append([[[2,2,2,2]], [[0,0,0,0]], [[0,0,0,0]], [[1,1,1,1]]], T).*/
    

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
