%  program that receives in input a number N, and prints all the numbers between 1 and N

% descending
printNToOne(1):-
    write(1), nl.
printNToOne(N):-
    N>1, write(N), nl, TheNext is N-1, printNToOne(TheNext). 
% se non calcoli esplicitamente theNext, mantiene ad es "3-1" senza calcolarlo e restituisce false 
% perché non sa che regola applicare tra le due (non determinismo)

% ascending
printOneToN(1):- 
    write(1), nl.
printOneToN(N):- 
    N>1, TheNext is N-1, printOneToN(TheNext), write(N), nl.