%% Metodo Punto Fijo
%{
--- Datos ejercicio 6.3
--- f(X) = -x^2 + 1.8*x + 2.5
--- g(X) = (1.8*x + 2.5)^(1/2)
--- x0 = 5
--- error = 0.05
%}
clear
clc
fprintf('\tMetodo Punto Fijo\n')
f = input('Ingrese una funcion de x -> f(x) = ','s');
fx = inline(f);
g = input('Ingrese la funcion g(x) = ','s');
gx = inline(g);
x0 = input('Ingrese valor de X0 = ');
margenError = input('Ingrese margen de error (0 - 100): ');
error = 100;
i = 1;
%comiezo de las iteraciones
x(1)=x0;
while error > margenError
    x(i+1) = gx(x(i));
    error(i+1) = abs((x(i+1)-x(i))/x(i+1))*100;
    k(i+1)=i;
    i = i + 1;
end
k=k(:); error=error(:); x=x(:);
plot(k,error,k,error,'*r')
Tabla=table(k,x,error);
Tabla
%% Metodo Newton Raphson
%{
--- Datos ejercicio 6.3 
--- f(X) = -x^2 + 1.8*x + 2.5
--- f'(X) = -2*x + 1.8
--- x0 = 5
--- error = 0.05
%}

%{
--- Datos ejercicio 6.4 
--- f(X) = -1 + 5.5*x - 4*x^2 + 0.5*x^3
--- f'(X) = 1.5x^2 - 8*x + 5.5
--- x0 = 1.4
--- error = 0.01
%}

%{
--- Datos ejercicio 6.9 
--- f(X) = 0.95*x^3 - 5.9*x^2 + 10.9*x - 6
--- f'(X) = 2.85*x^2 - 11.8*x + 10.9
--- x0 = 3.5
--- error = 0.01
%}

clear
clc
fprintf('\tMetodo Newton Raphson\n')
f = input('Ingrese una funcion de x -> f(x) = ','s');
fx = inline(f);
g = input('Ingrese la funcion f`(x) = ','s');
gx = inline(g);
x0 = input('Ingrese valor de X0 = ');
margenError = input('Ingrese margen de error (0 - 100): ');
error = 100;
i = 1;
%comiezo de las iteraciones
x(1)=x0;
while error > margenError
    x(i+1) = x(i)-(fx(x(i))/gx(x(i)));
    error(i+1) = abs((x(i+1)-x(i))/x(i+1))*100;
    k(i+1)=i;
    i = i + 1;
end
k=k(:); error=error(:); x=x(:);
plot(k,error,k,error,'*r')
Tabla=table(k,x,error);
Tabla
%% Metodo Secante
%{
--- Datos ejercicio 6.6 
--- f(X) = -12 - 21*x + 18*x^2 -2.4*x^3
--- x0 = -0.6
--- x1 = -0.2
--- error = 0.01
%}
%{
--- Datos ejercicio 6.7 
--- f(X) = sin(x) + cos(1 + (x^2)) - 1
--- x0 = 1.5
--- x1 = 2.25
--- error = 0.01
%}
%{
--- Datos ejercicio 6.9 
--- f(X) = 0.95*x^3 - 5.9*x^2 + 10.9*x - 6
--- x0 = 2.5
--- x1 = 3.5
--- error = 0.01
%}

clear
clc
fprintf('\tMetodo Secante\n')
f = input('Ingrese una funcion de x -> f(x) = ','s');
fx = inline(f);
x0 = input('Ingrese valor de X0 = ');
x1 = input('Ingrese valor de x1 = ');
margenError = input('Ingrese margen de error (0 - 100): ');
error = 100;
i = 1;
%comiezo de las iteraciones
x(1)=x1;
while error > margenError
    x(i+1)=x(i)-(fx(x(i))*((x0-x(i))))/(fx(x0)-fx(x(i)));
    error(i+1) = abs((x(i+1)-x(i))/x(i+1))*100;
    k(i+1) = i;
    x0 = x(i);
    i = i + 1;
end
k=k(:); error=error(:); x=x(:);
plot(k,error,k,error,'*r')
Tabla=table(k,x,error);
Tabla
%% Metodo de la secante modificado
%{
--- Datos ejercicio 6.9 
--- f(X) = 0.95*x^3 - 5.9*x^2 + 10.9*x - 6
--- x0 = 3.5
--- constante = 0.01
--- error = 0.05
%}

clear
clc
fprintf('\tMetodo Secante Modificado\n')
f = input('Ingrese una funcion de x -> f(x) = ','s');
fx = inline(f);
x0 = input('Ingrese valor de X0 = ');
c = input('Ingrese valor de la constante = ');
margenError = input('Ingrese margen de error (0 - 100): ');
error = 100;
i = 1;
%comiezo de las iteraciones
x(1)=x0;
while error > margenError
    x(i+1)=x(i)-(c*x(i)*fx(x(i)))/(fx(x(i)+c*x(i))-fx(x(i)));
    error(i+1) = abs((x(i+1)-x(i))/x(i+1))*100;
    k(i+1) = i;
    i = i + 1;
end
k=k(:); error=error(:); x=x(:);
plot(k,error,k,error,'*r')
Tabla=table(k,x,error);
Tabla