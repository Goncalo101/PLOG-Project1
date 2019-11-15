initialMenu:-
    clearConsole,
    write(' _____________________________________________________ '),nl,
    write('|                            2019, PLog Trademark Inc |'),nl,
    write('|                                                     |'),nl,
    write('|     ______  _             _                         |'),nl,
    write('|    |  ____|| |           | |                        |'),nl,
    write('|    | |____ | |___  _____ | |___  _   _              |'),nl,
    write('|    |_____ ||  _  ||  _  ||  _  || | | |             |'),nl,
    write('|     ____| || | | || |_| || |_| || |_| |             |'),nl,
    write('|    |______||_| |_||_____||_____||_____|             |'),nl,
    write('|                                                     |'),nl,
    write('|                                                     |'),nl,
    write('|              Press Any Key to Continue              |'),nl,
    write('|_____________________________________________________|'),nl,nl.

startMenu:-
    clearConsole,
    write(' _____________________________________________________ '),nl,
    write('|                            2019, PLog Trademark Inc |'),nl,
    write('|                                                     |'),nl,
    write('|                        MENU                         |'),nl,
    write('|                                                     |'),nl,
    write('|    (1) Play                                         |'),nl,
    write('|                                                     |'),nl,
    write('|    (2) Rules and Information                        |'),nl,
    write('|                                                     |'),nl,
    write('|    (3) Credits                                      |'),nl,
    write('|                                                     |'),nl,
    write('|    (4) Exit                                         |'),nl,
    write('|_____________________________________________________|'),nl,nl.

                                 
getAnyKey(Key):-
    get_code(Key), nl.

clearConsole:-
    write('\e[H\e[2J'), nl.

rules :-
    clearConsole,
    write('In this game you have to blablabla'), nl,
    write('Press return to go back'),nl,
    getAnyKey(Key),
    setMenuState(Key).

credits :-
    clearConsole,
    write('This program was made by'), nl,
    write('Press return to go back'), nl,
    getAnyKey(Key),
    setMenuState(Key).

setMenuState(10) :-
    startMenuHandler.

/* setGameState receives the ascii character of the input key*/
setGameState(49) :-
    start.

setGameState(50) :-
    rules.    

setGameState(51) :-
    credits.

setGameState(52) :-
    halt.

setGameState(_) :-
    startMenuHandler.

startMenuHandler :-
    startMenu,
    getAnyKey(Key),
    setGameState(Key).

initialMenuHandler :-
    initialMenu,
    getAnyKey(Key),
    Key > -1,
    startMenuHandler.
