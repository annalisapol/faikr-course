 /*Define a Prolog program that receives in input a number N, and
print all the numbers between 1 and N.*/

specialPrint(1) :-
    write(1), nl.
specialPrint(N):-
    N>1,
    write(N), nl,
    NewN is N-1,
    specialPrint(NewN).


/*Define a Prolog program that receives in input a number N, and
print all the numbers between 1 and N, from the smallest to the
greatest.*/

specialPrint(1) :-
    write(1), nl.
specialPrint(N):-
    N>1,
    NewN is N-1,
    specialPrint(NewN),
    write(N), nl.
    
/*Define a Prolog program that computes the Fibonacci number.*/

fibonacci(0,0).

fibonacci(1,1).

fibonacci(N, Result):-
    N>1,
	Prev is N-1,
    Pprev is N-2,
    fibonacci(Prev,Res1),
    fibonacci(Pprev,Res2),
    Result is Res1+Res2.
    
/* Write a predicate about a number N, that is true if N is prime */

isPrime(2).

isPrime(N):-
    N>2,
    TheDiv is N-1,
    cannotBeDividedBy(N, TheDiv).
    
cannotBeDividedBy(N, 2) :-
    1 is N mod 2.
    
cannotBeDividedBy(N, TheDiv) :-
    TheDiv > 2,
    Res is N mod TheDiv,
    Res > 0,
    TheNDiv is TheDiv - 1,
    cannotBeDividedBy(N, TheNDiv).


/*Write a predicate that, given a number N, prints out all
the prime numbers between 2 and N.*/

printOnlyPrimes(2) :-
    printOnlyIfItIsPrime(2).
printOnlyPrimes(N) :-
    N>2,
    printOnlyIfItIsPrime(N),
    TheNext is N-1,
    printOnlyPrimes(TheNext).

printOnlyIfItIsPrime(N) :-
    isPrime(N),
    write("Number "), write(N), write(" is prime"),nl.
printOnlyIfItIsPrime(_).
isPrime(2).
isPrime(N) :-
 N>2,
 TheDiv is N-1,
 cannotBeDividedBy(N, TheDiv).
cannotBeDividedBy(N, 2) :-
 1 is N mod 2.
cannotBeDividedBy(N, TheDiv) :-
 TheDiv>2,
 Rest is N mod TheDiv,
 Rest > 0,
 TheNextDiv is TheDiv-1,
 cannotBeDividedBy(N, TheNextDiv).