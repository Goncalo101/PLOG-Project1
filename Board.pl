:- use_module(library(lists)).
:- include('Piece.pl').

start:- initBoard(Board), displayGame(Board).
vsep :- write('|').
hsep :- write('+---+---+---+---+  +---+---+---+---+'), nl.

/* initialize board as a 2x2 matrix of boards */
initBoard(Board) :-
    append([[
            [
                [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]], 
                [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]]
            ],
            [
                [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]], 
                [[2,2,2,2], [0,0,0,0], [0,0,0,0], [1,1,1,1]]
            ]
           ]], Board).

/* print player number */
printPlayer(N) :-
    write('Player '),
    write(N),
    nl.

/* print board number*/
printBoardNumber(N) :-
    write('Board '),
    N1 is N * 2 - 1,
    write(N1),
    write('            Board '),
    N2 is N1 + 1,
    write(N2),
    nl.

/*print column letter*/
printColumnLetter :-
    write('  a   b   c   d      a   b   c   d  ').

printLineNumber(K) :-
    write(K).

printSep(2) :- vsep.
printSep(_).

printHSep(4).
printHSep(_) :- hsep.

/* translation for values in the internal data structure which will be displayed in displayGame */
translate(0, ' ').
translate(1, 'X').
translate(2, 'O').

/* print a single cell with a vertical separator */
printCell(C) :-
    translate(C,P),
    vsep,
    write(' '),
    write(P),
    write(' ').

/* print a line of a single board */
printLine([]).
printLine([C|L]):-
    printCell(C),
    printLine(L).

/* print a line to the screen, this line contains the Nth line of the top or bottom boards */ 
printBoardLine([], 0, K) :- nl.
printBoardLine([Line|Lines], N, K) :-
    N > 0,
    N1 is N - 1,
    printLine(Line),
    vsep,
    printLineNumber(K),
    write(' '),
    printBoardLine(Lines, N1, K).

/* print boards after transposing */
printTransposed([], 0, K).
printTransposed([Current|Next], N, K) :-
    N > 0,
    N1 is N - 1,
    K > -1,
    K1 is K + 1,
    printHSep(N),
    printBoardLine(Current, 2, K1),
    printTransposed(Next, N1, K1).


/* print top and bottom boards */
printBoards([], 3):- nl.
printBoards([Top|Bottom], N) :-
    N1 is N + 1, nl, 
    printPlayer(N),
    printBoardNumber(N),
    hsep,
    transpose(Top, Transposed),
    printTransposed(Transposed, 4, 0),
    hsep, 
    printColumnLetter, nl,
    printBoards(Bottom, N1).

/* print the 4 boards as a 2x2 matrix */
displayGame(Board) :-
    printBoards(Board, 1).

