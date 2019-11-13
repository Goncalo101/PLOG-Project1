:- include('Game.pl').

initialMenu:-
    clearConsole,
    write(' _____________________________________________________ '),nl,
    write('|                               PLog 2019 Trademark® |'),nl,
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
    write('|_____________________________________________________|'),nl,nl,
    getAnyKey(Key),nl,
    Key > -1 -> startMenu.

startMenu:-
    clearConsole,
    write(' _____________________________________________________ '),nl,
    write('|                               PLog 2019 Trademark® |'),nl,
    write('|                                                     |'),nl,
    write('|                                                     |'),nl,          
    write('|    (1) Play                                         |'),nl,       
    write('|                                                     |'),nl,   
    write('|    (2) Rules and Information                        |'),nl,    
    write('|                                                     |'),nl,
    write('|    (3) Credits                                      |'),nl,
    write('|                                                     |'),nl,
    write('|    (4) Exit                                         |'),nl,
    write('|                                                     |'),nl,
    write('|_____________________________________________________|'),nl,nl.
                                 
getAnyKey(Key):-
    get_code(Key).

clearConsole:-
    write('\e[H\e[2J').
    