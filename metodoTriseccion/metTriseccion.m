%% Ejercicio 5.1
clear
clc
format long
fx = @(x) -0.5*x.^2 + 2.5*x + 4.5;
xa = 5;
xb = 10;
vAnt1 = 0;
vAnt2 = 0;
iteraciones = 4;
raiz = 0;
%-----------------
%variables que solo sirven para la impresion
limiteSuperior = 0;
limiteAnterior = 0;
errorRespuesta = 0;
%-----------------
fprintf('Ejercicio 5.1\nTabla de iteraciones\n');
fprintf('i\txa\t\txr1\t\txr2\t\txb\t\ter1\t\ter2\n');

for i = 1 : iteraciones
    paso = (xb - xa)/3;
    xr1 = xa + paso;
    xr2 = xr1 + paso;
    er1 = abs((xr1 - vAnt1)/xr1)*100;
    er2 = abs((xr2 - vAnt2)/xr2)*100;
    vAnt1 = xr1;
    vAnt2 = xr2;
    limiteSuperior = xa;
    limiteAnterior = xb;
    fprintf('%d\t%3.4f\t%3.4f\t%3.4f\t%3.4f\t%3.3f\t%3.3f\n',i,xa,xr1,xr2,xb,er1, er2);
    if fx(xa) * fx(xr1) < 0
        xb = xr1;
    elseif fx(xr1) * fx(xr2) < 0
        xa = xr1;
        xb = xr2;
    elseif fx(xr2) * fx(xb) < 0
        xa = xr2;
    end
end
if er1 < er2
    raiz = xr1;
    errorRespuesta = er1;
else
    raiz = xr2;
    errorRespuesta = er2;
end

%presentacion de resultados
fprintf('\nFuncion: ')
fx
fprintf('Xa = %3.6f\n', limiteSuperior)
fprintf('Xb = %3.6f\n', limiteAnterior)
fprintf('Raiz = %3.6f\n', raiz)
fprintf('Error Porcentual = %3.2f\n', errorRespuesta)
fplot(fx, [-2 7])
title('f(x) = -0.5x^2 + 2.5x + 4.5')
grid on