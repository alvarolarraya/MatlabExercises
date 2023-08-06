%% Prática 1a: Introducción a la teoría y lógica fuzzy
% Muchos de vosotros ya conoceréis los jupyer notebooks de python (y los más 
% eruditos quizá hasta os suene el cuaderno de Mathematica), estas prácticas se 
% realizan en live scripts de matlab, que son el equivalente (aunque un poco más 
% justo de funciones). La idea es que contestéis los ejercicios en cada celda. 
% Para evaluar cada cuaderno, se ejecuta y se comprueba que las salidas de cada 
% ejercicio son las correctas. Como norma general, basta con sustituir el valor 
% NaN que se asigna por defecto a las variables donde se buscará la solución por 
% el valor correcto.
% 
% *Como asegurarse de que el corrector lee bien vuestros resultados*: Las soluciones 
% de cada ejercicio se colocan en una estructura. Una estructura es conceptualmente 
% un "diccionario" o registro, donde se tiene un índice que asocia cada campo 
% con un valor. Su comportamiento en MATLAB es análogo al de las estructuras de 
% C (que puede que conozcáis ya). El corrector automático buscará en vuestras 
% estructuras los campos con nombres específicos para ver si su valor es el correcto. 
% (Esto vale para todas las prácticas).

solution = {}
%% 
% Esta es structura donde se guardarán todos los resultados, así que asguraos 
% de no cambiar el nombre de nada que ya venga escrito en el cuaderno.
% 
% Nota final: aseguraos de mandar los fichero como ficheros matlab normales, 
% NO .mlx (los mlx son más complicados de ejecutar desde consola de comandos)
% 
% Por si ya habéis entrado en modo pánico: los nombres que hay que dar a cada 
% resultado vienen especificados en cada celda, así que es más complicado hacerlo 
% mal que bien.
% Preliminar
% En esta práctica se va a utilizar MATLAB para la representación de conjuntos 
% fuzzy y realizar las operaciones entre ellos. Deberíais haber visto ya en las 
% clases teoría algo sobre teoría difusa. No obstante, a medida que hagáis (y 
% falléis)  los ejercicios, veréis que en la teoría no hay diferencia entre teoría 
% y práctica, pero en la práctica si. 
% 
% Hay que ser especialmente cuidadoso con los referenciales continuos, o los 
% discretos: ¿Puedo tener 1,5 años? ¿Puede haber 10 grados y medio? ¿Y 10,0004? 
% La respuesta es que sí, porque todos esos referenciales son continuos. Pero 
% mi familia no puede estar compuesta por 1 persona y media o no puedo tener media 
% cuenta corriente en el banco. Parece sencillo ahora, pero luego veremos que 
% estos conceptos en la práctica no aparecen de forma tan obvia y es fácil confundirse.
%% *Ejemplo de representación de un conjunto difuso de 10 elementos:* $x_1, \dots , x_{10}$
% Crear un vector cuyos elementos sean los números entre el 1 y el 10. Es decir, 
% crear el conjunto referencial.

X = 1:10 %Nota:observad que el punto coma final esta quitado para que veais salida, pero vosotros teneis que ponerlo si no quereis llenaros la pantalla de variables intermedias
%% 
% Crear un vector cuyo elementos sean lo grado de pertenencia de cada elemento 
% de $X$ al conjunto difuso 1.

mu1_x = [0 0 0.2 0.5 0.7 1 0.7 0.5 0.2 0]
%% 
% Mostrar el conjunto difuso resultante.

figure;
plot(X, mu1_x, 'or');
title('Funciones de pertenencia');
hold on;
%% 
% Si queremos generar y mostrar un segundo conjunto difuso sobre el mismo referencial 
% $X$.

mu2_x = [1 1 0.7 0.5 0.2 0 0 0 0 0]
plot(X, mu2_x, 'ob');
%% 
% Mostramos el significado de cada conjunto.

legend('Conjunto 1','Conjunto 2');
%% *Ejercicio 1* 
% Crea los conjuntos difusos A y B definidos como $(x, \mu(x))$: 
% 
% $$A = (1,0.1) + (2, 0.3) + (3,0.7) + (4, 1.0) + (5, 0.6) + (6, 0.2) + (7, 
% 0.1)$$

%Ejercicio 1a
A = [1 2 3 4 5 6 7];
mul_a = [0.1 0.3 0.7 1.0 0.6 0.2 0.1];
solution.ej1a_1 = mul_a;
%% 
% $$B = (1, 0.2) + (2, 0.8) + (3, 1.0) + (4, 0.6) + (5, 0.4) + (6, 0.3) + (7, 
% 0.1)$$

B = [1:7];
mul_b = [0.2 0.8 1 0.6 0.4 0.3 0.1];
solution.ej1a_2 = mul_b;
%% 
% Mostrar el resultado de aplicar las siguientes operaciones sobre los conjuntos 
% difusos A y B (el resultado es otro conjunto difuso en el mismo referencial) 
% (C es el complementario/negación) :
%% 
% * $A \cup B$

solution.ej1b_1 = max(mul_a,mul_b);
%% 
% * $A \cap B$

solution.ej1b_2 = min(mul_a,mul_b);
%% 
% * $C(B)$

solution.ej1b_3 = 1-mul_b;
%% 
% * $C(A\cup B)$

solution.ej1b_4 = 1-max(mul_a,mul_b);
%% 
% * $C(C(A) \cap B)$

solution.ej1b_5 = 1-min(1-mul_a, mul_b);
%% 
% Utiliza la t-norma mínimo para modelar la intersección, la t-conorma máximo 
% para modelar la unión y la negación (1-x) para modelar el complementario.

%Ejercicio 1c
solution.ej1c_1 =  max(mul_a,mul_b);
solution.ej1c_2 = min(mul_a,mul_b);
solution.ej1c_3 = 1-mul_b;
solution.ej1c_4 = 1-max(mul_a,mul_b);
solution.ej1c_5 = 1-min(1-mul_a, mul_b);
%% *Ejercicio 2* 
% Realiza el ejercicio 1 aplicando:
% 
% • El producto como t-norma y la suma probabilística $(x+y-xy)$ como t-conorma.

%Ejercicio 2a
solution.ej2a_1 = mul_a+mul_b-mul_a.*mul_a;
solution.ej2a_2 = mul_a.*mul_b;
solution.ej2a_3 = 1-mul_b;
solution.ej2a_4 = 1-(mul_a+mul_b-mul_a.*mul_a);
solution.ej2a_5 = 1-((1-mul_a).*mul_b);
%% 
% • Lukasievitz como t-norma $(max(0, x+y-1))$ y su t-conorma dual $(min(1,x+y))$

%Ejercicio 2b
solution.ej2b_1 = min(1,mul_a+mul_b);
solution.ej2b_2 = max(0,mul_a+mul_b-1);
solution.ej2b_3 = 1-mul_b;
solution.ej2b_4 = 1-(min(1,mul_a+mul_b));
solution.ej2b_5 = 1-max(0,1-mul_a+mul_b-1);
%% Ejercicio 3 
% En este ejercicio vamos a definir conjuntos difusos para ofrecer sensación 
% de continuidad sobre el referencial. Para ello, vamos a utilizar un referencial 
% X que comience en 0 y acabe en 10 y vamos a considerar todos los elementos de 
% dicho intervalo con saltos de 0.1 en 0.1. Utilizando dicho referencial crear 
% los siguientes conjuntos difusos:
%% 
% * $\mu_F(x) = \frac{1}{1 + (x-5)^4}$
% * $\mu_G(x) = 2^{-x}$
% * $\mu_H(x) = \frac{1}{(1+10(x-2)^2 )}$

%Ejercicio 3a
X = [0:0.1:10];
solutions.ej3a_1 = 1./(1+(X-5).^4);
solutions.ej3a_2 = 2.^(-X);
solutions.ej3a_3 = 1./(1+10.*(X-2).^2);
figure;
plot(X, solutions.ej3a_1, 'or');
hold on;
plot(X, solutions.ej3a_2, 'og');
hold on;
plot(X, solutions.ej3a_3, 'ob');
title('Funciones de pertenencia');
hold on; 
legend('Conjunto 1','Conjunto 2', 'Conjunto 3');
%% 
% Utilizando la t-norma mínimo para modelar la intersección, la t-conorma máximo 
% para modelar la unión y la negación (1-x) para modelar el complementario; mostrar 
% los conjuntos difusos anteriores en una figura y calcular y mostrar (en otra 
% figura) el resultado las expresiones de las funciones de pertenencia para los 
% siguientes conjuntos difusos:
%% 
% * $C(F), C(H), C(G)$

%Ejercicio 3b
solutions.ej3b_1 = 1-solutions.ej3a_1;
figure;
plot(X, solutions.ej3b_1, 'or');
solutions.ej3b_2 = 1-solutions.ej3a_3;
figure;
plot(X, solutions.ej3b_2, 'or');
solutions.ej3b_3 = 1-solutions.ej3a_2;
figure;
plot(X, solutions.ej3b_3, 'or');
%% 
% * $F \cup G \cup H, F \cap G \cap H$

%Ejercicio 3c
solutions.ej3c_1 = max(solutions.ej3a_1,max(solutions.ej3a_2,solutions.ej3a_3));
figure;
plot(X, solutions.ej3c_1, 'or');
solutions.ej3c_2 = min(solutions.ej3a_1,min(solutions.ej3a_2,solutions.ej3a_3));
figure;
plot(X, solutions.ej3c_2, 'or');
%% 
% * $F \cap C(H), C(C(G) \cap H), C(F \cup H)$

%Ejercicio 3d
solutions.ej3d_1 = min(solutions.ej3a_1,1-solutions.ej3a_3);
figure;
plot(X, solutions.ej3d_1, 'or');
solutions.ej3d_2 = 1-min(1-solutions.ej3a_2,1-solutions.ej3a_3);
figure;
plot(X, solutions.ej3d_2, 'or');
solutions.ej3d_3 = 1-max(solutions.ej3a_1,solutions.ej3a_3);
figure;
plot(X, solutions.ej3d_3, 'or');
%% Ejercicio 4
% Vamos a generar 3 etiquetas lingüísticas (joven, adulto, anciano) utilizadas 
% en la variable difusa edad. El conjunto referencial de dicha variable comienza 
% en 0 y acaba en 100. En primer lugar vamos a crear el conjunto difuso asociado 
% a la etiqueta lingüística adulto. Para ello vamos a utilizar la siguiente ecuación:
% 
% $$\mu_{adulto}(x) = \frac{1}{1 + (\frac{x - 50}{10})^4}$$
% 
% A partir de dicha conjunto difuso se deben obtener los conjuntos difusos correspondientes 
% a las etiquetas lingüísticas joven y anciano. Para ello, se debe tener en cuenta 
% que la unión de las 3 funciones de pertenencia debe formar una partición fuerte 
% de Ruspini (para cada elemento del referencial la suma de los grados de pertenencia 
% a las 3 etiquetas lingüísticas debe ser igual a 1).
% 
% Pista: los últimos avances en biología afirman que no se puede ser viejo y 
% joven a la vez.

%Ejercicio 4
X = 0:0.1:100;
Y = 0:0.1:50;
Z = 50:0.1:100;
[filasY,columnasY] = size(Y);
[filasX,columnasX] = size(X);
[filasZ,columnasZ] = size(Z);
solutions.ej4_adulto = 1./(1+((X-50)./10).^4);
solutions.ej4_joven(1:columnasY) = 1-1./(1+((Y-50)./10).^4);
solutions.ej4_joven(columnasY+1:columnasX) = 0;
solutions.ej4_anciano(1:columnasZ) = 0;
solutions.ej4_anciano(columnasX-columnasZ+1:columnasX) = 1-1./(1+((Z-50)./10).^4);
figure;
plot(X, solutions.ej4_adulto, 'ob');
hold on;
plot(X, solutions.ej4_joven, 'or');
title('edad');
hold on;
plot(X, solutions.ej4_anciano, 'og');
legend('adulto','joven','anciano');
suma = solutions.ej4_anciano+solutions.ej4_adulto+solutions.ej4_joven;
figure;
plot(X, suma, 'ob');
%% Ejercicio 5
% Se deben aplicar modificadores lingüísticos (modifican la forma del conjunto 
% difuso) a los conjuntos difusos obtenidos en el ejercicio 4. En concreto se 
% deben mostrar los conjuntos difusos correspondientes a las siguientes expresiones:
%% 
% # Muy joven: $\mu_{joven}(x)^2$

solutions.ej5_1 = solutions.ej4_joven.^2;
plot(X, solutions.ej5_1, 'or');
%% 
% 2. Bastante anciano: $\mu_{anciano}(x)^{1/2}$

solutions.ej5_2 = solutions.ej4_anciano.^(1/2);
plot(X, solutions.ej5_2, 'og');
%% 
% 3. Ligeramente adulto: (muy adulto y no muy adulto): $\mu_{adulto}(x)^2 \cap 
% 1 - \mu_{adulto}(x)^2$

solutions.ej5_3 = min(solutions.ej4_adulto.^2,1-solutions.ej4_adulto.^2);
plot(X, solutions.ej5_3, 'ob');