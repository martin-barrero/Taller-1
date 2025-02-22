%Hechos.
estadounidense(coronel_west). %El coronel West es estadounidense.
nacion_hostil(corea_sur). %Corea del Sur es una nación hostil.
arma(misil). %Un misil es un arma.
vendio(coronel_west, misil, corea_sur). %El coronel West vendió un misil a Corea del Sur.

%Reglas.
criminal(X) :- estadounidense(X), nacion_hostil(Y), arma(Z), vendio(X, Z, Y). %X es criminal si es estadounidense y vendió un arma Z a una nación hostil Y.