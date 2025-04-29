% Write a predicate about a number N, that is true if N is prime

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