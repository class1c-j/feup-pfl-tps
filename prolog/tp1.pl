                                % 1
                                % a
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
male(phil).

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

                                % b
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

grandmother(Grandmother, Grandchild) :-
    female(Grandmother),
    grandparent(Grandmother, Grandchild).

siblings(First, Second) :-
    parent(ParentA, First),
    parent(ParentA, Second),
    parent(ParentB, First),
    parent(ParentB, Second),
    ParentA @< ParentB,
    First \= Second.

halfSiblings(First, Second) :-
    parent(Parent, First),
    parent(Parent, Second),
    \+ siblings(First, Second),
    First \= Second.

cousins(First, Second) :-
    parent(ParentA, First),
    parent(ParentB, Second),
    siblings(ParentA, ParentB).

uncle(Uncle, Nephew) :-
    male(Uncle),
    siblings(Parent, Uncle),
    parent(Parent, Nephew).

                                % e

married(jay, gloria, 2008).
married(jay, dede, 1968).

divorced(jay, dede, 2003).

is_married_in(First, Second, Year) :-
    married(First, Second, YearMarried),
    Year >= YearMarried,
    \+ divorced(First, Second, _).

is_married_in(First, Second, Year) :-
    married(First, Second, YearMarried),
    Year >= YearMarried,
    divorced(First, Second, YearDivorced),
    Year < YearDivorced.

                                % 2
                                % a
leciona(algoritmos, adalberto).
leciona(basesDeDados, bernardete).
leciona(compiladores, capitolino).
leciona(estatistica, diogenes).
leciona(redes, ermelinda).

frequenta(algoritmos, alberto).
frequenta(algoritmos, bruna).
frequenta(algoritmos, cristina).
frequenta(algoritmos, diogo).
frequenta(algoritmos, eduarda).

frequenta(basesDeDados, antonio).
frequenta(basesDeDados, bruno).
frequenta(basesDeDados, cristina).
frequenta(basesDeDados, duarte).
frequenta(basesDeDados, eduardo).

frequenta(compiladores, alberto).
frequenta(compiladores, bernardo).
frequenta(compiladores, clara).
frequenta(compiladores, diana).
frequenta(compiladores, eurico).

frequenta(estatistica, antonio).
frequenta(estatistica, bruna).
frequenta(estatistica, claudio).
frequenta(estatistica, duarte).
frequenta(estatistica, eva).

frequenta(redes, alvaro).
frequenta(redes, beatriz).
frequenta(redes, claudio).
frequenta(redes, diana).
frequenta(redes, eduardo).

                                % b
alunoDe(Aluno, Professor) :-
    leciona(Uc, Professor),
    frequenta(Uc, Aluno).

professorDe(Professor, Aluno) :-
    alunoDe(Aluno, Professor).

alunoSimultaneo(Aluno, Professor1, Professor2) :-
    alunoDe(Aluno, Professor1),
    alunoDe(Aluno, Professor2),
    Professor1 @< Professor2.

colega(Aluno1, Aluno2) :-
    frequenta(Uc, Aluno1),
    frequenta(Uc, Aluno2),
    Aluno1 @< Aluno2.

colega(Professor1, Professor2) :-
    professorDe(Professor1, _),
    professorDe(Professor2, _),
    Professor1 \= Professor2.

frequentaMaisQueUmaUc(Aluno) :-
    alunoSimultaneo(Aluno, Professor1, Professor2),
    Professor1 @< Professor2.

                                % 3
                                % a
pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(macLean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

team(lamb, breitling).
team(besenyei, redBull).
team(chambliss, redBull).
team(macLean, mrt).
team(mangold, cobra).
team(jones, matador).
team(bonhomme, matador).

plane(lamb, mx2).
plane(besenyei, edge540).
plane(chambliss, edge540).
plane(macLean, edge540).
plane(mangold, edge540).
plane(jones, edge540).
plane(bonhomme, edge540).

circuit(istanbul).
circuit(budapest).
circuit(porto).

gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

won(porto, jones).
won(budapest, mangold).
won(istanbul, mangold).

teamWon(Team, Circuit) :-
    team(Pilot, Team),
    won(Circuit, Pilot).

                                % b

hasMoreThan8Gates(Circuit) :-
    circuit(Circuit),
    gates(Circuit, N),
    N > 8.

wonMoreThanOne(Pilot) :-
    circuit(Circuit1),
    circuit(Circuit2),
    won(Circuit1, Pilot),
    won(Circuit2, Pilot),
    Circuit1 \= Circuit2.

                                % 4
traduz(1, 'Integer Overflow').
traduz(2, 'Divisão por zero').
traduz(3, 'ID Desconhecido').

                                % 5
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

% c

chefe(Chefe, Chefiado) :-
    cargo(CargoChefe, Chefe),
    cargo(CargoChefiado, Chefiado),
    chefiado_por(CargoChefiado, CargoChefe).

chefiadoMesmoCargo(P1, P2) :-
    cargo(CargoP1, P1),
    cargo(CargoP2, P2),
    chefiado_por(CargoP1, _Chefe),
    chefiado_por(CargoP2, _Chefe),
    P1 @< P2.
