%Hechos.
padre_de(abraham, herbert).
padre_de(abraham, homero).
padre_de(clancy, marge).
padre_de(clancy, patty).
padre_de(clancy, selma).
padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).

madre_de(mona, homero).
madre_de(jacqueline, marge).
madre_de(jacqueline, patty).
madre_de(jacqueline, selma).
madre_de(marge, bart).
madre_de(marge, lisa).
madre_de(marge, maggie).
madre_de(selma, ling).

es_mujer(mona).
es_mujer(jacqueline).
es_mujer(marge).
es_mujer(patty).
es_mujer(selma).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

es_hombre(abraham).
es_hombre(clancy).
es_hombre(herbert).
es_hombre(homero).
es_hombre(bart).

%Reglas.
abuelo_de(X, Y):-
    es_hombre(X),
    padre_de(X, Z),
    (padre_de(Z, Y); madre_de(Z, Y)).

abuela_de(X, Y):-
    es_mujer(X),
    madre_de(X, Z),
    (padre_de(Z, Y); madre_de(Z, Y)).

hermano_de(X, Y) :-
    es_hombre(X),
    ((padre_de(Z, X), padre_de(Z, Y)), (madre_de(W, X), madre_de(W, Y));
    (padre_de(Z, X), padre_de(Z, Y)); (madre_de(W, X), madre_de(W, Y))),
    X \= Y.

hermana_de(X, Y) :-
    es_mujer(X),
    ((padre_de(Z, X), padre_de(Z, Y)), (madre_de(W, X), madre_de(W, Y));
    (padre_de(Z, X), padre_de(Z, Y)); (madre_de(W, X), madre_de(W, Y))),
    X \= Y.

tio_de(X, Y) :-
    ((hermano_de(X, Z), padre_de(Z, Y)); (hermano_de(X, Z), madre_de(Z, Y))).

tia_de(X, Y) :-
    ((hermana_de(X, Z), padre_de(Z, Y)); (hermana_de(X, Z), madre_de(Z, Y))).

primo_de(X, Y):-
    es_hombre(X),
    (tio_de(Z, Y) ; tia_de(Z, Y)),
    (padre_de(Z, X) ; madre_de(Z, X)).

prima_de(X, Y):-
    es_mujer(X),
    (tio_de(Z, Y) ; tia_de(Z, Y)),
    (padre_de(Z, X) ; madre_de(Z, X)).