%Hechos
estadounidense(coronel_west).
nacion_hostil(corea_sur).
vendio(coronel_west, misil, corea_sur).

%Reglas
criminal(X) :- estadounidense(X), nacion_hostil(Y), vendio(X, misil, Y).