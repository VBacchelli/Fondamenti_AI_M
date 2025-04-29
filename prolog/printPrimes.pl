% Write a predicate that, given a number N, prints out allthe prime numbers between 2 and N.
printPrimes(2):-
    printOnlyIfPrime(2).

printPrimes(N):-
    N>2,
    Prev is N-1,
    printPrimes(Prev),
    printOnlyIfPrime(N).

printOnlyIfPrime(N):-
    isPrime(N),
    write(N),
    nl.

printOnlyIfPrime(N):- % da mettere anche la regola negativa senno appena trova un num non primo si ferma e dà false
    \+isPrime(N).

isPrime(2).

isPrime(N):-
    N>2,
    Div is N-1,
    notDivisible(N,Div).

notDivisible(N,2):-
    1 is N mod 2. % scritto in questo ordine perché operatore is vuole un valore già calcolato a sx

notDivisible(N,Div):-
    Div>2,
    Resto is N mod Div,
    Resto > 0,
    NextDiv is Div-1,
    notDivisible(N,NextDiv).