:- use_module(library(lists)).
:- dynamic round/4.

                                % round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs])
                                % round/4 indica, para cada ronda, o estilo de dança, a sua duração, e os pares de dançarinos participantes.
round(1, waltz, 8, [eugene-fernanda]).
round(2, quickstep, 4, [asdrubal-bruna,cathy-dennis,eugene-fernanda]).
round(3, foxtrot, 6, [bruna-dennis,eugene-fernanda]).
round(4, samba, 4, [cathy-asdrubal,bruna-dennis,eugene-fernanda]).
round(5, rhumba, 5, [bruna-asdrubal,eugene-fernanda]).

                                % tempo(DanceStyle, Speed).
                                % tempo/2 indica a velocidade de cada estilo de dança.
tempo(waltz, slow).
tempo(quickstep, fast).
tempo(foxtrot, slow).
tempo(samba, fast).
tempo(rhumba, slow).


                                % style_round_number(?DanceStyle, ?RoundNumber)
style_round_number(DanceStyle, RoundNumber) :-
    round(RoundNumber, DanceStyle, _Minutes, _Pairs).

                                % n_dancers(?RoundNumber, -NDancers)
n_dancers(RoundNumber, NDancers) :-
    round(RoundNumber, _Style, _Minutes, Pairs),
    length(Pairs, NPairs),
    NDancers is 2 * NPairs.

                                % danced_in_round(?RoundNumber, ?Dancer)
danced_in_round(RoundNumber, Dancer) :-
    round(RoundNumber, _Style, _Minutes, Pairs),
    member(Dancer-_, Pairs).

danced_in_round(RoundNumber, Dancer) :-
    round(RoundNumber, _Style, _Minutes, Pairs),
    member(_-Dancer, Pairs).

                                % n_rounds(-NRounds)
n_rounds(NRounds) :-
    round(NRounds, _Style, _Minutes, _Pairs),
    \+ ((round(R, _, _, _), R > NRounds)).

                                % add_dancer_pair(+RoundNumber, +Dancer1, +Dancer2)
add_dancer_pair(RoundNumber, Dancer1, Dancer2) :-
    \+ danced_in_round(RoundNumber, Dancer1),
    \+ danced_in_round(RoundNumber, Dancer2),
    round(RoundNumber, Style, Minutes, Pairs),
    retract(round(RoundNumber, Style, Minutes, Pairs)),
    assert(round(RoundNumber, Style, Minutes, [Dancer1-Dancer2|Pairs])).

                                % total_dance_time(+Dancer, -Time)
total_dance_time(Dancer, Time) :-
    dance_time(Dancer, [], 0, Time).

dance_time(Dancer, Rounds, Acc, Time) :-
    danced_in_round(Round, Dancer),
    \+ member(Round, Rounds),
    !,
    round(Round, _Style, Minutes, _Pairs),
    Acc1 is Acc + Minutes,
    dance_time(Dancer, [Round | Rounds], Acc1, Time).

dance_time(_Dancer, _Rounds, Time, Time).

                                % print_program
print_program :-
    round(_Round, Style, Minutes, Pairs),
    write(Style),
    write(' ('),
    write(Minutes),
    write(') - '),
    length(Pairs, NPairs),
    write(NPairs),
    nl,
    fail.

print_program.

                                % dancer_n_dances(?Dancer, NDances)
dancer_n_dances(Dancer, NDances) :-
    bagof(Round, danced_in_round(Round, Dancer), Rounds),
    length(Rounds, NDances).

                                % most_tireless_dancer(-Dancer)
most_tireless_dancer(Dancer) :-
    setof(Time-Dancer, Round^(danced_in_round(Round, Dancer), total_dance_time(Dancer, Time)), List),
    reverse(List, [_Time-Dancer | _]).

edge(a,b).
edge(a,c).
edge(a,d).
edge(b,e).
edge(b,f).
edge(c,b).
edge(c,d).
edge(c,e).
edge(d,a).
edge(d,e).
edge(d,f).
edge(e,f).

                                % shortest_safe_path(+Origin, +Destination, +ProhibitedNodes, -Path)
shortest_safe_path(Origin, Destination, ProhibitedNodes, Path) :-
    \+ member(Origin, ProhibitedNodes),
    \+ member(Destination, ProhibitedNodes),
    bfs([[Origin]], Destination, ProhibitedNodes, AuxPath),
    reverse(AuxPath, Path).

bfs( [[Destination | T] | _], Destination, _, [Destination | T]).
bfs([[Na | T] | Ns], Destination, ProhibitedNodes, Solution):-
    findall([Nb, Na|T],
            ( edge(Na, Nb),
                \+ (member(Nb, [Na | T])),
                \+ (member(Nb, ProhibitedNodes))), L),
    append(Ns, L, NewNs),
    bfs(NewNs, Destination, ProhibitedNodes, Solution).

% all_shortest_safe_paths(+Origin, +Destination, +ProhibitedNodes, ListOfPaths)
all_shortest_safe_paths(Origin, Destination, ProhibitedNodes, ListOfPaths) :-
    shortest_safe_path(Origin, Destination, ProhibitedNodes, Shortest),
    !,
    length(Shortest, N),
    bagof(Path, (shortest_safe_path(Origin, Destination, ProhibitedNodes, Path),
                    length(Path, N)), ListOfPaths).

