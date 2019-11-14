:- include('board.pl').
:- include('menu.pl').

play:-
    initialMenuHandler.

/* Create a Move*/
start :-
    start(Board, 1),
    initialInfo,
    passiveMove(1, Board),
    write('Done!').

initialInfo:-
    write('Player 1 is the X'), nl,
    write('Player 2 is the O'), nl, nl,
    write('Player with X starts!'), nl, nl.

move(Move, Board, NewBoard) :-
    passiveMove(Player, Board),
    agressiveMove(Player, Board, PrevBoardNo, DeltaLine, DeltaColumn).

passiveMove(Player, Board):-
    write('Passive move'), nl,
    getBoardNumber(BoardNo),
    getOriginCoordinates(OLine, OColumn),
    getDestinationCoordinates(DLine, DColumn),
    setPiece(Player, BoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, BoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard, Player), nl,
    agressivePlayTactic(OLine, OColumn, DLine, DColumn, LineDif, ColDif), nl,
    agressiveMove(Player, FollowingBoard, BoardNo, LineDif, ColDif).

agressiveMove(Player, Board, PrevBoardNo, DeltaLine, DeltaColumn) :-
    write('Agressive move'), nl,
    getBoardNumber(NewBoardNo),
    /* Using not because the function dont return after insert a correct board*/
    not(agressiveBoardPossibilities(PrevBoardNo, NewBoardNo)),
    getOriginCoordinates(OLine, OColumn), nl,
    DLine is OLine + DeltaLine,
    DColumn is OColumn + DeltaColumn,
    setPiece(Player, NewBoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, NewBoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard, Player), nl,
    write('Press any key to pass the turn'),
    getAnyKey(Key),
    changePlayer(Player, NewPlayer),
    clearConsole,
    displayGame(FollowingBoard, NewPlayer), nl,
    passiveMove(NewPlayer, FollowingBoard).

agressivePlayTactic(OLine, OColumn, DLine, DColumn, LineDif, ColDif):-
    LineDif is DLine-OLine,
    ColDif is DColumn-OColumn.

agressiveBoardPossibilities(PrevNumber, NewBoardNo):-
    (PrevNumber is 2;
    PrevNumber is 4),
    (NewBoardNo is 2;
    NewBoardNo is 4),
    write('The number of the board for the agressive move should be 1 or 3'), nl, nl,
    getBoardNumber(NewBoardNumber),
    agressiveBoardPossibilities(PrevNumber, NewBoardNumber).

agressiveBoardPossibilities(PrevNumber, NewBoardNo):-
    (PrevNumber is 1;
    PrevNumber is 3),
    (NewBoardNo is 1;
    NewBoardNo is 3),
    write('The number of the board for the agressive move should be 2 or 4'), nl, nl,
    getBoardNumber(NewBoardNumber),
    agressiveBoardPossibilities(PrevNumber, NewBoardNumber).

not(X):-
    X, !, fail.

not(X).

changePlayer(2, Player2):-
    Player2 is 1.

changePlayer(1, Player2):-
    Player2 is 2.

getDestinationCoordinates(DLine, DColumn) :-
    write('Destination coordinates'), nl,
    getDestinationLine(DLine),
    getDestinationColumn(DColumn).

getOriginCoordinates(OLine, OColumn) :-
    write('Origin coordinates'), nl,
    getOriginLine(OLine),
    getOriginColumn(OColumn).