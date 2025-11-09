/*Write a predicate that given a list, it returns the last element.*/

last([X], X).
last([_|Tail], X):-
    last(Tail, X).

/*Write a predicate that given two lists L1 and L2, returns true 
 * if and only if L1 is a sub-list of L2. */

sublist([], _).
    
sublist([H|T1], [H|T2]) :-
    sublist(T1, T2).

sublist(T1, [_|T2]):-
    sublist(T1, T2).
    
/* Write a predicate that returns true if and only if 
   a list is a palindrome.*/

palindrome([]).
palindrome([_]).
palindrome([H|L]):-
    last(L,H),
    remove_last(L, L1),
    palindrome(L1).

remove_last([_], []).
remove_last([H|L1], [H|L2]):-
    remove_last(L1,L2).
	
last([X], X).
last([_|Tail], X):-
    last(Tail, X).

/* OR Write a predicate that returns true if and only if 
   a list is a palindrome.*/

palindrome([]).
palindrome([_]).
palindrome([H|L]):-
    append(L1, [H], L),
	palindrome(L1).
    
append([], L1, L1).
append([H |Rest1], L2, [H | NewTail]) :-
	append(Rest1, L2, NewTail).


/* Write a predicate that, given a list (possibly with repeated elements),
returns a new list with repeated elements.*/

duplicates([], []).

duplicates([Head|L], Res):-
    findDuplicate(Head, L),
    deleteAllOccurences(Head, L, NewL),
    append([Head],PrevRes, Res),
    duplicates(NewL, PrevRes).

duplicates([Head|L], Res):-
    \+findDuplicate(Head,L),
    duplicates(L, Res ).
	
findDuplicate([], []).
findDuplicate(X, [X|_]).
findDuplicate(X, [Head|L]):-
    Head \= X,
    findDuplicate(X, L).
        
append([], L1, L1).
append([H |Rest1], L2, [H | NewTail]) :-
	append(Rest1, L2, NewTail).

deleteAllOccurences(_, [], []).
deleteAllOccurences(El, [El|T], Result):- deleteAllOccurences(El, T, Result).
deleteAllOccurences(El, [H|T], [H|T1]) :- deleteAllOccurences(El, T, T1).

/* Write a predicate that given a term T and a list L, 
   counts the number of occurrences of T in L.*/

counting(_, [], 0).

counting(T, [T|Tail], X):-
    counting(T, Tail, MinX),
    X is MinX + 1.

counting(T, [H|Tail], X):-
    H \= T,
    counting(T, Tail, X).

/*Write a predicate that, given a list, returns a new list obtained by
flattening the first list. Example: given the list [1,[2,3,[4]],5,[6]] the
predicate should return the list [1,2,3,4,5,6].*/

flatten([], []).

flatten([H|L], Res):-
    flatten(H, R1),
    flatten(L, R2),
	append(R1,R2, Res).
    
flatten(X, [X]).

append([], L1, L1).
append([H |Rest1], L2, [H | NewTail]) :-
append(Rest1, L2, NewTail).

/*Write a predicate that given a list, returns a new list that is the first one,
but ordered.*/

ordering([], []).
ordering(L, Res):-
    smallestOccurrence(L, X),
	deleteFirstOccurence(X, L, L1),
    ordering(L1, R1),
	append([X], R1, Res).	
    
smallestOccurrence([Head|L], Res):-
    smallestOccurrence(L, R1),
	smallest(Head, R1, R2),
    Res is R2.
smallestOccurrence([X], X).

smallest(X, Y, X):-
    X =< Y.
smallest(X, Y, Y):-
    Y =< X.
append([], L1, L1).
append([Head|Rest], L2, [Head|Res]):-
    append(Rest, L2, Res).
    
deleteFirstOccurence(El, [], []).
deleteFirstOccurence(El, [El|T], T).
deleteFirstOccurence(El, [H|T], [H|T1]) :- deleteFirstOccurence(El, T, T1).
    