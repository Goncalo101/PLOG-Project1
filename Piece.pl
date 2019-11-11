getBoardNumber:-
    write('Board: '),
    get_code(Bd),
    read_line(_),
    Board is Bd-48,
    Board > 0,
    Board < 5.

getOriginLine:-
    write('Line: '), 
    get_code(Li),
    read_line(_),
    Line is Li-48.

getOriginColumn:-
    write('Column: '), 
    get_char(Co),
    read_line(_),
    char_code(Co, Code),
    Column is Code-96.

getDestinyLine:-
    write('Line: '), 
    get_code(Li2),
    read_line(_),
    Line2 is Li2-48.

getDestinyColumn:-
    write('Column: '), 
    get_char(Co2),
    read_line(_),
    char_code(Co2, Code2),
    Column2 is Code2-96.
