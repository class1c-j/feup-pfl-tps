                                % 1
s(1).
s(2) :- !.
s(3).

% 2

data(one).
data(two).
data(three).
cut_test_a(X):- data(X).
cut_test_a('five').
cut_test_b(X):- data(X), !.
cut_test_b('five').
cut_test_c(X, Y):- data(X), !, data(Y).
cut_test_c('five', 'five').

% 3
person(socorro).
age(socorro, 17).
immature(X):- adult(X), !, fail.
immature(X).
adult(X):- person(X), !, age(X, N), N >=18.
adult(X):- turtle(X), !, age(X, N), N >=50.
adult(X):- spider(X), !, age(X, N), N>=1.
adult(X):- bat(X), !, age(X, N), N >=5.

% 4
% a
print_n(S, N) :-
    N > 0,
    N1 is N - 1,
    put_char(S),
    print_n(S, N1).

% 5
                                %a
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

                                % c

father(P, Child) :- parent(P, Child), male(P).
grandparent(GP, C) :- parent(P, C), parent(GP, P).
mother(P, Child) :- parent(P, Child), female(P).
grandmother(GM, C) :- parent(P,C), parent(GM, P).
siblings(A, B) :- parent(P1, A), parent(P1, B), parent(P2, A), parent(P2, B), P1 @< P2, A \= B.
halfsiblings(A, B) :- parent(P, A), parent(P, B), A \= B, \+ siblings(A, B).

first_alphabetical_child(P, C) :- parent(P, C), \+ ((parent(P, C2), C2 @< C)).

cousins(A, B) :-
    siblings(P1, P2), parent(P1, A), parent(P2, B), (A \= B), (P1 \= P2).

uncle(A, B) :-
    male(A), siblings(A, P1), parent(P1, B), (A \= B).

married(jay, gloria, 2008).
married(jay, dede, 1968).
divorced(jay, dede, 2003).

currently_married(A, B, Year) :-
    married(A, B, Year1),
    Year >= Year1,
    \+ divorced(A, B, _).

currently_married(A, B, Year) :-
    married(A, B, Year1),
    Year >= Year1,
    divorced(A, B, Year2),
    Year =< Year2.


children(Person, Children) :-
    findall(Child, parent(Person, Child), Children).

children_of(ListOfPeople, ListOfPairs) :-
    findall(Parent-Child, parent(Parent, Child), ListOfPairs).

family(F) :-
    findall(Person, female(Person), ListOfFemales),
    findall(Person, male(Person), ListOfMales),
    append(ListOfFemales, ListOfMales, F).

couple(C) :-
    setof(P1-P2, (parent(P1, C1), parent(P2, C1), P1 @< P2), C).

couples(List) :-
    findall(P1-P2, (parent(P1, C1), parent(P2, C1), P1 @< P2), List).
