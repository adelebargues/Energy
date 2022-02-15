function [RDM1, RDM2] = diagramme(x1,x2,F1x,F1y,F2x,F2y,L1,L2,x)
[~,p]=size(x);

N1 = zeros(1,p);N2 = zeros(1,p); %défini la taille de la matrice correspondant aux efforts normaux
T1 = zeros(1,p);T2 = zeros(1,p);
M1 = zeros(1,p);M2 = zeros(1,p);
for i=1:p
    N1(i) = -F1x*(x(i)<=x1)+F2y; %-F1x*(x(i)<=x1) condition, si x est bien inf ou égal à x1, la parenthèse sera =1, sinon elle sera =0 et fera disparaître ce terme --> dépend de où on est sur la barre
    T1(i) = -F1y*(x(i)<=x1)-F2x;
    M1(i) = -(x1-x(i))*L1*F1y*(x(i)<=x1)-F2x*(1-x(i))*L1-F2y*x2*L2;
    N2(i) = -F2x*(x(i)<=x2);
    T2(i) = -F2y*(x(i)<=x2);
    M2(i) = -(x2-x(i))*L2*F2y*(x(i)<=x2);
end
RDM1 = {N1,T1,M1}; %tableau vectoriel dans lequel on met d'autres vecteurs (=tableau de cellule)
RDM2 = {N2,T2,M2};
