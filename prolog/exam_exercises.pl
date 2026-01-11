
/*
max_nondecreasing_prefix(L, P)
vero quando P è il prefisso più lungo possibile di L tale che gli elementi sono in ordine non decrescente.
*/
max_nondecreasing_prefix([], []).
max_nondecreasing_prefix([H1|L1], [H1|P]):-
    checkIncrease(L1, H1, P).

checkIncrease([], _, []).

checkIncrease([H2|L1], H1, [H2 |P]):-
    H2>= H1, !,
    checkIncrease(L1, H2, P).
checkIncrease([H2|_], H1, []):-
    H2 < H1.

/*
inThirdPositions(L1, L2)
vero quando L2 contiene gli elementi di L1 che si trovano in posizione multipla di 3 (prima posizione = 1).
*/
inThirdPositions([],[]). 
inThirdPositions(L1, L2):- 
    checkThird(L1, 1, L2). 
checkThird([], _, []). 
checkThird([H1|L1], N, [H1|L2]):- 
    0 is mod(N, 3),!, 
        N1 is N+1, 
        checkThird(L1, N1, L2). 
checkThird([_|L1], N, L2):- 
    N1 is N+1, 
    checkThird(L1, N1, L2).

/*
Il candidato è invitato a definire un predicato filter_unique(L1, L2, L3) 
che riceve in input due liste di termini ground L1 e L2 e 
restituisce L3 contenente tutti e soli gli elementi che compaiono in entrambe, 
senza ripetizioni, mantenendo l’ordine del primo incontro in L1.
*/
filter_unique(_, [], []). 
filter_unique([], _, []). 
filter_unique([H1 | L1], L2, [H1 | L3]):- 
    member(H1, L2), 
    filter_unique(L1, L2, L3), 
    \+member(H1, L3). 
filter_unique([_ | L1], L2, L3):- 
filter_unique(L1, L2, L3).

/*
Il candidato è invitato a definire un predicato Prolog inEvenPositions(L1, L2) 
vero quando L2 è la lista contenente gli elementi di L1 che si trovano 
in posizione pari (considerando la prima posizione come 1).
*/
inEvenPositions([], []). 
inEvenPositions(L1, L2):- 
    checkEven(L1, 1, L2). 
checkEven([], _, []). 
checkEven([H | L1], N, [H | L2]):- 
    0 is mod(N, 2), 
    N1 is N+1, 
    checkEven(L1, N1, L2). 
checkEven([_ | L1], N, L2):- 
    N1 is N+1, 
        checkEven(L1, N1, L2).