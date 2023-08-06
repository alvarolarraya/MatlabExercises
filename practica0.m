%EJERCICIO 1
%A

x = [10:5:100] %en matlab se pone primero de donde va, luego de cuanto en cuanto y por ultimo hasta donde va
%B
x = [10:15]


%EJERCICIO 2
a=[4 3 8 1]
b=[2 2 1 6]
%A
suma = a+b

%B
c = a.*b

%C
d = a.^b


%EJERCICIO 3
a = rand(2,3)
%A
%[filasA, columnasA] = size(a)                  NO HACE FALTA PERO PARA QUE SEPAS QUE ESTA AHI
identidad = eye(size(a))
b = [a identidad]

%B
c = a(1:end, 1:2:end)

%c
d = a(2:2:end, 1:end)


%EJERCICIO 4
a = rand(4,4)
%A
traspuesta = a'

%B
sumaFilas = sum(a,2)

%C
sumaColumnas = sum(a)

%D
sumaDiagonal = sum(diag(a))

%E
submatriz = a(1:2,1:2)


%EJERCICIO 5
a = [1 1 0;0 2 3;3 3 1]
%A
resultado = a(3,1:end)+3.*a(1,1:end)

%B
fliplr(a)

%C
b = a(1:end,1:2:3);
b = b'


%EJERCICIO 6
a = [1 3 5 7] 
b = [2 4 6 8]
c = [b;3.*b;5.*b;7.*b]


%EJERCICIO 7
a = [2 1 5 -1; 4 -3 2 -1; 3 7 -3 4; -2 -2 4 0]
a((a>-2) & (a<4)) = 10


%EJERCICIO 8
a = [1 4 0;0 2 3;6 3 7]
[c, b] = sort(a,2);
b


%EJERCICIO 9
a = rand(2000,3000);
b = rand(2000,3000);
%A
tic
a.*b;
t = toc

%B
tic
[m,n] = size(a);
for i = 1:1:m
    for j = 1:1:n
        multiplicacion(i,j) = a(i,j)*b(i,j);
    end
end
t = toc

%C
tic
[m,n] = size(a);
i = 1;
j = 1;
while i ~= m
    while j ~= n
        multiplicacion(i,j) = a(i,j)*b(i,j);
        j = j+1;
    end
    i = i+1;
end
t = toc


%EJERCICIO 10
a = rand(2000,3000);
b = rand(2000,1);
%A
tic
bsxfun(@times,a,b);
t = toc

%B
tic
a.*repmat(b,1,3000);
t = toc

%C
tic
[m,n] = size(a);
for i = 1:1:n
    multiplicacion1(:,i) = a(:,i).*b;
end
t = toc

%D
tic
[m,n] = size(a);
for i = 1:1:m
    for j = 1:1:n
        multiplicacion2(i,j) = a(i,j).*b(i);
    end
end
t = toc


%EJERCICIO 11
elimina(5);


%EJERCICIO 12
a = [3 0 1;0 5 2;0 0 7];
b = [3 0 9;7 3 0;0 4 3];
dividir(a,b)


%EJERCICIO 13
x = [-1:6];
y = funcionEjer13(x);
plot(x,y)


%EJERCICIO 14
x = [0:360];
ax1 = subplot(2,1,1);
plot(x, sin(x), 'r')
title('seno')
xlabel('x')
ylabel('y')
ax2 = subplot(2,1,2);
plot(x, cos(x), 'g')
title('coseno')
xlabel('x')
ylabel('y')

function y = elimina(numero)
    if numero > 10 | numero < 5
        disp('Éste número no cumple las precondiciones')
    else
        y = rand(1,numero);
        disp('antes de borrar')
        disp(y)
        y(4) = [];
        disp('después de borrar')
        disp(y)
    end
end

function c = dividir(a,b)
    c = a./b;
    c(c == Inf) = -999
    c(isnan(c)) = 111
end

function y = funcionEjer13(x)
    y = x.^4 - 5.*x.^3 + 4.*x.^2 + 2;
end