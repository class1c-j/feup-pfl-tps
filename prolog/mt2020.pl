jogo(1,sporting,porto,1-2).
jogo(1,maritimo,benfica,2-0).
jogo(2,sporting,benfica,0-2).
jogo(2,porto,maritimo,1-0).
jogo(3,maritimo,sporting,1-1).
jogo(3,benfica,porto,0-2).
treinadores(porto,[[1-3]-sergio_conceicao]).
treinadores(sporting,[[1-2]-silas,[3-3]-ruben_amorim]).
treinadores(benfica,[[1-3]-bruno_lage]).
treinadores(maritimo,[[1-3]-jose_gomes]).

n_treinadores(Equipa, Numero) :-
    treinadores(Equipa, Treinadores),
    length(Treinadores, Numero).

n_jornadas_treinador(Treinador, NumeroJornadas) :-
    treinou(Treinador, _Equipa, [Inicio-Fim]),
    NumeroJornadas is 1 + Fim - Inicio.


treinadorLista(Treinador, [Jornadas-Treinador | _], Jornadas).
treinadorLista(Treinador, [_-OutroGajo | T], Jornadas) :-
    Treinador \= OutroGajo,
    treinadorLista(Treinador, T, Jornadas).

treinou(Treinador, Equipa, Jornadas) :-
    treinadores(Equipa, Treinadores),
    treinadorLista(Treinador, Treinadores, Jornadas).

ganhou(Jornada, Casa, Fora) :-
    jogo(Jornada, Casa, Fora, GolosCasa-GolosFora),
    GolosCasa > GolosFora.

ganhou(Jornada, Fora, Casa) :-
    jogo(Jornada, Casa, Fora, GolosCasa-GolosFora),
    GolosFora > GolosCasa.

:- op(180, fx, o).
:- op(200, xfx, venceu).

o X :-
    treinadores(X, _).

o X venceu o Y :-
    ganhou(_, X, Y).

treinou_jornada(Treinador, Jornada) :-
    treinou(Treinador, _Equipa, [Inicio-Fim]),
    Jornada >= Inicio,
    Jornada =< Fim.

perdeu_o_jogo(Treinador) :-
    treinadores(Equipa, Treinadores),
    treinadorLista(Treinador, Treinadores, _Jornadas),
    setof(Jornada, (treinou_jornada(Treinador, Jornada), ganhou()), )

% treinador_bom(Treinador) :-
