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

% e
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
