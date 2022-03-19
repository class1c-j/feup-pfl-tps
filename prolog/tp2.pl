% 1
% a
% fatorial(+N, ?F)
fatorial(N, F) :-
    N >= 0,
    fatorial_aux(N, 1, F).

fatorialAux(0, F, F).
fatorialAux(N, Acc, F) :-
    N >= 1,
    N1 is N - 1,
    Acc1 is Acc * N,
    fatorialAux(N1, Acc1, F).

% b
% somaRec(+N, ?Sum)
somaRec(N, Sum) :-
    N >= 1,
    somaRecAux(N, 0, Sum).

somaRecAux(0, Sum, Sum).
somaRecAux(N, Acc, Soma) :-
    N >= 1,
    N1 is N - 1,
    Acc1 is Acc + N,
    somaRecAux(N1, Acc1, Soma).

% 2

male(frank).
male(jay).
male(javier).
male(merle).
male(mitchel).
male(cameron).
male(manny).
male(pameron).
male(bo).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(haley).
female(alex).
female(lily).
female(poppy).


parent(grace, phill).
parent(frank, phill).

parent(dede, claire).
parent(jay, claire).

parent(dede, mitchel).
parent(jay, mitchel).

parent(gloria, joe).
parent(jay, joe).

parent(gloria, manny).
parent(javier, manny).

parent(barb, cameron).
parent(merle, cameron).

parent(barb, pameron).
parent(merle, pameron).

parent(phil, haley).
parent(claire, haley).

parent(phil, alex).
parent(claire, alex).

parent(phil, luke).
parent(claire, luke).

parent(mitchel, lily).
parent(cameron, lily).

parent(mitchel, rexford).
parent(cameron, rexford).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(dylan, george).
parent(haley, george).

parent(dylan, poppy).
parent(haley, poppy).


ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

descendant(X, Y) :-
    ancestor(Y, X).

% 3

cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).

chefe(X, Y) :-
    cargo(C1, X),
    cargo(C2, Y),
    chefiado_por(C1, C2).

superior(X, Y) :-
    chefe(Y, X).

superior(X, Y) :-
    chefe(Y, Z),
    superior(X, Z).

% ex4

% a. yes
% b. no (erro sintático)
% c. yes
% d. H = pfl ; T = [lbaw, redes, ltw]
% e. H = lbaw ; T = [ltw]
% f. H = leic ; T = []
% g. no
% h. H = leic ; T = [[pfl, ltw, lbaw, redes]]
% i. H = leic ; T = [Two]
% j. Inst = gram ; LEIC = feup
% k. One = 1 ; Two = 2 ; Tail = [3,4]
% l. One = leic ; Rest = [Two | Tail]

% 5

% list_size(+List, ?Size)

list_size([], 0).
list_size([_ | T], Size) :-
    list_size(T, S1),
    Size is 1 + S1.

% list_sum(+List, ?Sum)

list_sum([], 0).
list_sum([H | T], S) :-
    list_sum(T, S1),
    S is H + S1.

% list_prod(+List, ?Prod)

list_prod([], 1).
list_prod([H | T], P) :-
    list_prod(T, P1),
    P is H * P1.

% inner_product(+List1, +List2, ?Result)

inner_product([], [], 0).
inner_product([H1 | T1], [H2 | T2], R) :-
    inner_product(T1, T2, R1),
    Part is H1 * H2,
    R is R1 + Part.

% count(+Elem, +List, ?Result)

count(_, [], 0).
count(Elem, [Elem | T], Result) :-
    count(Elem, T, R1),
    Result is R1 + 1.

count(Elem, [H | T], Result) :-
    Elem =\= H,
    count(Elem, T, Result).

% 6

% a
invert([],[]).
invert([H|T],Rev) :-
    invert(T,TRev),
    append(TRev,[H],Rev).

invert2(L,Rev) :-
    invert2_aux(L,[],Rev).

invert2_aux([], L, L).
invert2_aux([H|T],Acc,Rev) :-
    invert2_aux(T,[H|Acc],Rev).


% b

% del_one(+Elem, +List1, ?List2)
del_one(Elem, [Elem | T], T).

del_one(Elem, [H | T], L2) :-
    Elem =\= H,
    del_one(Elem, T, L),
    L2 = [H | L].

% c

% del_all(+Elem, +List1, ?List2)

del_all(_, [], []).

del_all(Elem, [Elem | T], L2) :-
    del_all(Elem, T, L2).

del_all(Elem, [H | T], L2) :-
    Elem \= H,
    del_all(Elem, T, L),
    L2 = [H | L].


% del_all_list(+ListElems, +List1, ?List2)

del_all_list(_, [], []).

del_all_list(ListElems, [H | T], List2) :-
    member(H, ListElems),
    del_all_list(ListElems, T, List2).

del_all_list(ListElems, [H | T], List2) :-
    \+ member(H, ListElems),
    del_all_list(ListElems, T, L),
    List2 = [H | L].


% del_dups(+List1, ?List2)

del_dups([], []).

del_dups([H | T], List2) :-
    member(H, T),
    del_all(H, T, L),
    del_dups(L, Res),
    List2 = [H | Res].

del_dups([H | T], List2) :-
    \+ member(H, T),
    del_one(H, List2, L),
    del_dups(T, L).


% list_perm(+L1, +L2)

list_perm([], []).
list_perm([H1 | L1], L2) :-
    del_one(H1, L2, L),
    list_perm(T1, L).

% 7

list_append([], L2, L2).
list_append([H1 | T1], L2, [H1 | T3]) :-
    list_append(T1, L2, T3).

list_member(Elem, List) :-
    append(_, [Elem|_], List).

list_last(List, Last) :-
    append(_, [Last | []], List).

