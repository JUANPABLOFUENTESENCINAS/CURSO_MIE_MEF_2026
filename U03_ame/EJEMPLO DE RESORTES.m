clc
clear

%1. DATOS DE ENTRADA
k=[100 200 100]   %Vector que contiene las cosntantes elasticas de cada elemento
%Con=[1 2;2 3;3 4] %Matriz de Conectividad
Cbo=[1;4]     %Matriz condiciones de Contorno
Punt=[2 150;3 140]     %Vector de Cargas

%2. VARIABLES
ne=length(k)  %numero de elementos
ngn=1         %numero de grados de libertad por nodo
nne=2         %numero de nodos por elemento
nn=ne+1       %numero de nodos totales de la estructura
ngt=nn*ngn    %numero de grados de libertad totales de la estructura
nnb=2         %condicion de contorno
nnc=size(Punt,1)  %nomero de nodos cargados

%3. MATRICES ELEMENTALES
for i=1:ne
  ke(:,:,i)=[k(i) -k(i);-k(i) k(i)];
end

%4. MATRIZ DE CONECTIVIDAD(SOLO EN SERIE)
% CORREGIDO: cada elemento tiene nne=2 nudos (1 GDL/nudo => 2 GDL por elemento),
% no 4. El bucle interno debe ir de 1 a nne, no de 1 a 4 (ese "4" era el
% numero de GDL de un elemento de portico/cercha 2D, no el de este problema
% de 1 GDL por nudo). Con(i,:) = [i, i+1] para conectividad en serie.
for i=1:ne
  for j=1:nne
  Con(i,j)=i+j-1;
  end
end


%5.ENSAMBLAJE DE MATRICES
K=zeros(ngt)
for i=1:ne
pos=Con(i,:)
K(pos,pos)=ke(:,:,i)+ K(pos,pos)
end

%6. VECTOR DE CARGAS PUNTUALES
F=zeros(ngt,1)

for i=1:nnc
pcp=Punt(i,1);%Posicion de la carga puntual
vcp=Punt(i,2);%Valor de la Carga puntual
F(pcp,1)=vcp+F(pcp,1);
end

%7. INTRODUCCION DE LAS CONDICIONES DE CONTORNO

for i=1:nnb
	nr=Cbo(i,1)%nudos con restricciones
    K(nr,:)=0;
    K(:,nr)=0;
    K(nr,nr)=1;
end
K
%8.SOLUCION DEL SISTEMA
disp('Los desplazamientos del sistemas son:')
u=K\F

%9.FUERZAS INTERNAS
for i=1:ne
  a=u(i);
  b=u(i+1);
uint=[a;b]
Fint=ke(:,:,i)*uint
end
