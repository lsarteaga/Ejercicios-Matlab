clear
clc
format short;
%colocar el nombre de la imagen RGB
image = imread('1.jpg');
%transformado la imagen RGB a Binaria
grayimage = rgb2gray(image);
bw = im2bw(grayimage);
bw = imbinarize(grayimage);

%obtencion de filas y columnas
[f c] = size(bw);

%peticion de datos
fprintf('\t\tESPE\n');
fprintf('\t\tMetodos Numericos 8844\n');
fprintf('\t\tLenin Arteaga\n');
xMin = input('\nIngrese Xmin: ');
xMax = input('Ingrese Xmax: ');
yMin = input('Ingrese Ymin: ');
yMax = input('Ingrese Ymax: ');

%obteniendo incrementos en X e Y 
pasoX = (xMax - xMin)/c;
pasoY = (yMax - yMin)/f;

%Ingreso de valor de X para el calculo
fprintf('\nIngrese valores multiplos de %f\n', pasoX);
xVal = input('Ingrese valor para x: ');

%transformacion
pix = xVal/pasoX;
aux = floor(pix);
a = bw(1:end,aux);
valores = find(a==0);

%transformacion en Y
vMin = min(valores);
yVal = pasoY*vMin;

resp = (f*pasoY) - yVal;
fprintf('Valor en Y: %f\n', resp);

imshow(bw)
impixelinfo


