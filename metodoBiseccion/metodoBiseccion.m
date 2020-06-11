%script de la practica 11/06/2020
clear
opcion = 0;

while opcion ~= 2
    clc
    cent = 0;
    %evaluacion del intervalo
    fprintf('\t\tMetodo de la Biseccion\n');
    while cent ~= 1
        f = input('Ingrese una funcion de x -> f(x)= ','s');
        fx = inline(f);
        xa = input('Ingrese el punto inferior xa = ');
        xb = input('Ingrese el punto superior xb = ');
        xr = (xa + xb)/2;
        f1 = (fx(xa));
        f2 = (fx(xb));
        f3 = (fx(xr));
        if f1<0 && f2<0 && f3<0
            cent = 0;
        else
            if f1>0 && f2>0 && f3>0
                cent = 0;
            else
                cent = 1;
            end
        end
        if cent == 0
            clear
            fprintf('\t\t\nINGRESE INTERVALOS DONDE ESTE LA RAIZ\n');
            cent = 0;
        end
    end
    %el algoritmo concluye con el con la condicion que se cumpla primero
    %es decir se cumple el errorMax o el numero de iteraciones....
    iterador = input('Ingrese numero de iteraciones: ');
    errorMax = input('Ingrese el error maximo (0 - 100): ');
    Vant = 0;
    k = 0;
    fprintf('iter \t\t\t xa \t\t\t xr \t\t\t xb \t\t\t error\n');
    vY = [];
    aux = 0;
    acumulador = 0;
    while aux == 0 && k <= iterador
        for k=1:iterador
            acumulador = acumulador + 1;
            xr = (xa + xb)/2;
            er = abs((xr - Vant)/xr);
            Vant = xr;
            vY = [vY, er];
            fprintf('%d \t\t\t %3.6f \t\t\t %3.6f \t\t\t\t %3.6f \t\t\t\t %3.6f\n',acumulador,xa,xr,xb,er);
            if (fx(xa)*fx(xr)) < 0
                xb = xr;
            else
                xa = xr;
            end
            
            aux2 = er*100;
            
            if aux2 <= errorMax
                %variable que termina el calculo del error
                aux = 1;
                break
            end 
        end
        if k >= iterador
            break
        end
        
    end
    
    fprintf('\n\t\tDatos Calculo Realizado\n');
    fprintf('\nFuncion: ');
    fx
    fprintf('\nRaiz (xr): %3.6f\n',xr); 
    fprintf('\nError: %3.6f\n', er);
   
    %grafica de error con iteraciones
    limiteX = length(vY);
    vX = 1:1:limiteX;
    plot(vX,vY);
    
    fprintf('\nDesea continuar ?\n');
    fprintf('\n1) Si\n');
    fprintf('\n2) No\n');
    opcion = input('\nIngrese opcion: ');

end

