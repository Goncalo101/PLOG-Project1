:- include('board.pl').
:- include('menu.pl').

play:-
    initialMenuHandler.

start:-
    start(Board, 1),
    possiblePassiveMove(1, BoardNo, Board, OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn, IntermediateLine, 
             IntermediateColumn, BehindLine, BehindColumn, Piece, Piece2, Piece3, Piece4).

/* Create a Move
start:-
    start(Board, 1),
    initialInfo,
    passiveMove(1, Board),
    write('Done!').*/

initialInfo:-
    write('Player 1 is the X'), nl,
    write('Player 2 is the O'), nl, nl,
    write('Player with X starts!'), nl, nl.

move(Move, Board, NewBoard) :-
    passiveMove(Player, Board),
    aggressiveMove(Player, Board, PrevBoardNo, DeltaLine, DeltaColumn).

passiveMove(Player, Board):-
    write('Passive move'), nl,
    possibleMove(Player, BoardNo, Board, OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn, IntermediateLine, 
             IntermediateColumn, BehindLine, BehindColumn, Piece, Piece2, Piece3, Piece4),
    /*TODO: A refazer daqui para baixo! */
    setPiece(Opposite, BoardNo, Board, NewLine, NewColumn, Board2),

    setPiece(Player, BoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, BoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard, Player), nl,
    aggressivePlayTactic(OLine, OColumn, DLine, DColumn, LineDif, ColDif), nl,
    aggressiveMove(Player, FollowingBoard, BoardNo, LineDif, ColDif).

opposite_player(1, 2).
opposite_player(2, 1).

aggressiveMove(Player, Board, PrevBoardNo, DeltaLine, DeltaColumn) :-
    write('aggressive move'), nl,
    aggressiveBoardPossibility(PrevBoardNo, NewBoardNo),
    getOriginCoordinates(OLine, OColumn), nl,
    calculateAgressivePlay(OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn),
    setPiece(Player, NewBoardNo, Board, DLine, DColumn, Board2),
    setPiece(0, NewBoardNo, Board2, OLine, OColumn, FollowingBoard),
    displayGame(FollowingBoard, Player), nl,
    gameOver(FollowingBoard, Winner),
    passingTheTurn(Player, NewPlayer),
    displayGame(FollowingBoard, NewPlayer), nl,
    passiveMove(NewPlayer, FollowingBoard).

possiblePassiveMove(Player, BoardNo, Board, OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn, IntermediateLine, 
             IntermediateColumn, BehindLine, BehindColumn, Piece, Piece2, Piece3, Piece4):-
    repeat,
    getBoardNumber(BoardNo),
    calculateDeltas(OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn),
    calculateIntermediatePiece(DeltaLine, DeltaColumn, IntermediateLine, IntermediateColumn),
    getPiece(BoardNo, Board, OLine, OColumn, Piece1),
    getPiece(BoardNo, Board, DLine, DColumn, Piece2),
    getIntermediatePiece(BoardNo, Board, OLine, OColumn, IntermediateLine, IntermediateColumn, Piece3),
    Piece1 is Player,
    Piece2 is 0,
    Piece3 < 1,
    write('Possible Passive Move!'), nl.

possibleAgressiveMove(Player, BoardNo, Board, OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn, IntermediateLine, 
             IntermediateColumn, BehindLine, BehindColumn, Piece, Piece2, Piece3, Piece4):-
    repeat,
    getBoardNumber(BoardNo),
    calculateDeltas(OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn),
    calculateIntermediatePiece(DeltaLine, DeltaColumn, IntermediateLine, IntermediateColumn),
    calculateBehindPiece(DLine, DColumn, DeltaLine, DeltaColumn, BehindLine, BehindColumn),
    getPiece(BoardNo, Board, OLine, OColumn, Piece1),
    getPiece(BoardNo, Board, DLine, DColumn, Piece2),
    getIntermediatePiece(BoardNo, Board, OLine, OColumn, IntermediateLine, IntermediateColumn, Piece3),
    getBehindPiece(BoardNo, Board, BehindLine, BehindColumn, Piece4),
    Piece1 is Player,
    Piece2 =\= Player,
    Piece3 < 1,
    Piece4 < 1,
    write('Possible Passive Move!'), nl.

getIntermediatePiece(BoardNo, Board, OLine, OColumn, IntermediateLine, IntermediateColumn, Piece):-
    (IntermediateLine =\= 0;
     IntermediateColumn =\= 0),
    IL is OLine + IntermediateLine,
    IC is OColumn + IntermediateColumn,
    getPiece(BoardNo, Board, IL, IC, Piece).

getIntermediatePiece(BoardNo, Board, OLine, OColumn, IntermediateLine, IntermediateColumn, Piece):-
    IntermediateLine is 0,
    IntermediateColumn is 0,
    Piece is -1.

getBehindPiece(BoardNo, Board, BehindLine, BehindColumn, Piece):-
    ((BehindLine < 1;
      BehindLine > 4);
     (BehindColumn < 1;
      BehindColumn > 4)),
    Piece is -1.

getBehindPiece(BoardNo, Board, BehindLine, BehindColumn, Piece):-
    getPiece(BoardNo, Board, BehindLine, BehindColumn, Piece).

calculateBehindPiece(DLine, DColumn, DeltaLine, DeltaColumn, BehindLine, BehindColumn):-
    calculateBehindCoord(DLine, DeltaLine, BehindLine),
    calculateBehindCoord(DColumn, DeltaColumn, BehindColumn).

calculateBehindCoord(Destination, Delta, Behind):-
    Delta > 0,
    Behind is Destination + 1.

calculateBehindCoord(Destination, Delta, Behind):-
    Delta < 0,
    Behind is Destination - 1.

calculateBehindCoord(Destination, Delta, Behind):-
    Delta is 0,
    Behind is Destination.

calculateIntermediatePiece(DeltaLine, DeltaColumn, IntermediateLine, IntermediateColumn):-
    deltaAnalysis(DeltaLine, IntermediateLine),
    deltaAnalysis(DeltaColumn, IntermediateColumn).

deltaAnalysis(Delta, Intermediate):-
    Delta is 2,
    Intermediate is 1.

deltaAnalysis(Delta, Intermediate):-
    Delta is -2,
    Intermediate is -1.

deltaAnalysis(Delta, Intermediate):-
    Delta < 2,
    Delta > -2,
    Intermediate is 0.

aggressivePlayTactic(OLine, OColumn, DLine, DColumn, LineDif, ColDif):-
    LineDif is DLine-OLine,
    ColDif is DColumn-OColumn.

aggressiveBoardPossibility(PrevNumber, NewBoardNo) :-
    repeat, 
    getBoardNumber(NewBoardNo),
    \+ aggressiveBoardPossibilities(PrevNumber, NewBoardNo).

aggressiveBoardPossibilities(PrevNumber, NewBoardNo):-
    (PrevNumber is 2;
    PrevNumber is 4),
    (NewBoardNo is 2;
    NewBoardNo is 4),
    write('The number of the board for the agressive move should be 1 or 3'), nl, nl.

aggressiveBoardPossibilities(PrevNumber, NewBoardNo):-
    (PrevNumber is 1;
    PrevNumber is 3),
    (NewBoardNo is 1;
    NewBoardNo is 3),
    write('The number of the board for the agressive move should be 2 or 4'), nl, nl.

calculateAgressivePlay(OLine, OColumn, DLine, DColumn, DeltaLine, DeltaColumn):-
    DLine is OLine + DeltaLine,
    DColumn is OColumn + DeltaColumn.

passingTheTurn(Player, NewPlayer):-
    write('Press any key to pass the turn'),
    getAnyKey(Key),
    changePlayer(Player, NewPlayer),
    clearConsole.

changePlayer(2, 1).
changePlayer(1, 2).

gameOver(Board, Winner):-
    endGame(Board, 1, 1, 1, 0, 0, 0, Winner),
    champion(Winner).

champion(Winner):-
    Winner > 0, 
    Winner < 3,
    write('Player '),
    write(Winner),
    write(' won the game!').
    /*TODO stuff to the finish menu*/

champion(Winner):-
    (Winner < 1;
    Winner > 2),
    write('Changing Player'), nl.

endGame(Board, BoardNumber, Row, Column, P1No, P2No, Counter, Winner):-
    (BoardNumber > 4 -> 
        Winner is 0;
        /*else*/
        (getPiece(BoardNumber, Board, Row, Column, Piece),
        Cnt is Counter + 1,
        (Piece is 1 -> 
            (P1Number is P1No + 1, P2Number is P2No);
        Piece is 2 -> 
            (P2Number is P2No + 1, P1Number is P1No);
        /*else*/
            (P1Number is P1No, P2Number is P2No)),
        (Column is 4 -> 
            (Line is Row + 1, Col is 1);
        /*else*/
            (Line is Row, Col is Column + 1)),
        ((Cnt is 16, P1Number is 0) -> 
            Winner is 2;
        (Cnt is 16, P2Number is 0) -> 
            Winner is 1;
        (P1Number > 0, P2Number > 0) -> 
            (BN is BoardNumber + 1, endGame(Board, BN, 1, 1, 0, 0, 0, Winner));
        /*else*/
            endGame(Board, BoardNumber, Line, Col, P1Number, P2Number, Cnt, Winner)))).
