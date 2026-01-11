/*
Define a Prolog meta interpreter that computes the maximum
depth of the SLD tree associated with a solution.
*/
p(X):- q(X), r(X).
q(X) :- t(X).
t(X) :-s(X).
s(1).
r(1).

solve(true, 0):-!.
solve((A,B), N):- 
    !,
    solve(A, N1),
    solve(B, N2),
    max(N1, N2, N).
solve(A, N1):-
    clause(A, B),
    solve(B, N),
    N1 is N+1.

max(0, X, X).
max(X, 0, X).
max(A, B, M):-
    A > B, !,
    M is A.
max(_, B, M):-
    M is B.

/*
Define a Prolog meta interpreter that will print the message "Eureka!" 
every time a subgoal is proved directly (fact).
*/
p(X):- q(X), r(X).
q(X) :- t(X).
t(X) :-s(X).
s(1).
r(1).

solve(true):-!.
solve((A,B)):- 
    !,
    solve(A),
    solve(B).
    
solve(A):-
    clause(A, true),  !, 
    write("Eureka!").

solve(A):-
    clause(A, B),
    B \= true,
    solve(B).