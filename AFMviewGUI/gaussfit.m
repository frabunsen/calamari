function par = gaussfit


% Dati
x = linspace(-1,1,100); % asse x
y = exp(- 0.5*(x - 0).^2 / (0.2*2)^2 ) / sqrt(2*pi*0.2) + rand(size(x)); % valori distribuiti circa su una sigmoide qualunque
plot(x,y,'o');
hold on;

% Funzione da minimizzare
d = @(v) sum(( v(3)+exp(- 0.5*(x - v(1)).^2 / (v(2)*2)^2 ) / sqrt(2*pi*v(2)) - y).^2); % differenza quadratica tra una curva sigmoide e i valori di y

% valori iniziali dei paramtri
v0 = [0.1 0.1 0.1];

% Stima dei parametri della sigmoide tramite minimizzazione fminsearch
par = fminsearch(d, v0);
plot(x,par(3)+exp(- 0.5* (x - par(1)).^2 / (par(2)*2)^2 ) / sqrt(2*pi*par(2)),'r');