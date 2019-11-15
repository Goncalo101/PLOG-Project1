getBoardNumber(BoardNo):-
    write('Board: '),
    get_code(Bd),
    read_line(_),
    BoardNo is Bd-48,
    BoardNo > 0,
    BoardNo < 5.

getOriginLine(OLine):-
    write('Line: '), 
    get_code(OLi),
    read_line(_),
    OLine is OLi-48,
    OLine > 0,
    OLine < 5.

getOriginColumn(OColumn):-
    write('Column: '), 
    get_char(OCo),
    read_line(_),
    char_code(OCo, OCode),
    OColumn is OCode-96,
    OColumn > 0,
    OColumn < 5.

getDestinationLine(DLine):-
    write('Line: '), 
    get_code(DLi),
    read_line(_),
    DLine is DLi-48,
    DLine > 0,
    DLine < 5.

getDestinationColumn(DColumn):-
    write('Column: '), 
    get_char(DCo),
    read_line(_),
    char_code(DCo, DCode),
    DColumn is DCode-96,
    DColumn > 0,
    DColumn < 5.


getDestinationCoordinates(DLine, DColumn) :-
    write('Destination coordinates'), nl,
    getDestinationLine(DLine),
    getDestinationColumn(DColumn).

getOriginCoordinates(OLine, OColumn) :-
    write('Origin coordinates'), nl,
    getOriginLine(OLine),
    getOriginColumn(OColumn).
