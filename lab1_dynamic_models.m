clc;
clear;
close all;

% ==============================
% Лабораторна робота №1
% Варіант 2
% Методи дослідження математичних моделей
% ==============================

% Час моделювання
t = 0:0.1:10;

% ==========================================
% Перша модель:
% 25y'' + 20y' + 20y = 15x
% W1(s) = 15 / (25s^2 + 20s + 20)
% ==========================================

num1 = [15];
den1 = [25 20 20];

W1 = tf(num1, den1);

figure;
step(W1, t);
grid on;
title('Перехідна характеристика першої моделі');
xlabel('t');
ylabel('y(t)');

% ==========================================
% Друга модель:
% 25y'' + 20y' = 5x
% W2(s) = 5 / (25s^2 + 20s)
% ==========================================

num2 = [5];
den2 = [25 20 0];

W2 = tf(num2, den2);

figure;
step(W2, t);
grid on;
title('Перехідна характеристика другої моделі');
xlabel('t');
ylabel('y(t)');

% ==========================================
% Частотні характеристики першої моделі
% ==========================================

w = 0.01:0.01:6;

W1jw = 15 ./ (25*(1i*w).^2 + 20*(1i*w) + 20);

U1 = real(W1jw);
V1 = imag(W1jw);
A1 = abs(W1jw);
phi1 = angle(W1jw);

figure;
plot(U1, V1);
grid on;
title('АФЧХ першої моделі');
xlabel('U(\omega)');
ylabel('V(\omega)');

figure;
plot(w, A1);
grid on;
title('АЧХ першої моделі');
xlabel('\omega');
ylabel('A(\omega)');

figure;
plot(w, phi1);
grid on;
title('ФЧХ першої моделі');
xlabel('\omega');
ylabel('\phi(\omega)');

% ==========================================
% Частотні характеристики другої моделі
% ==========================================

W2jw = 5 ./ (25*(1i*w).^2 + 20*(1i*w));

U2 = real(W2jw);
V2 = imag(W2jw);
A2 = abs(W2jw);
phi2 = angle(W2jw);

figure;
plot(U2, V2);
grid on;
title('АФЧХ другої моделі');
xlabel('U(\omega)');
ylabel('V(\omega)');

figure;
plot(w, A2);
grid on;
title('АЧХ другої моделі');
xlabel('\omega');
ylabel('A(\omega)');

figure;
plot(w, phi2);
grid on;
title('ФЧХ другої моделі');
xlabel('\omega');
ylabel('\phi(\omega)');

% ==========================================
% Виведення таблиць значень
% ==========================================

w_table1 = [0 0.5 1 2 4];
W1_table = 15 ./ (25*(1i*w_table1).^2 + 20*(1i*w_table1) + 20);

Table1 = table( ...
    w_table1', ...
    real(W1_table)', ...
    imag(W1_table)', ...
    abs(W1_table)', ...
    angle(W1_table)', ...
    'VariableNames', {'omega', 'U', 'V', 'A', 'phi'} ...
);

disp('Таблиця частотних характеристик першої моделі:');
disp(Table1);

w_table2 = [0.2 0.5 1 2 4];
W2_table = 5 ./ (25*(1i*w_table2).^2 + 20*(1i*w_table2));

Table2 = table( ...
    w_table2', ...
    real(W2_table)', ...
    imag(W2_table)', ...
    abs(W2_table)', ...
    angle(W2_table)', ...
    'VariableNames', {'omega', 'U', 'V', 'A', 'phi'} ...
);

disp('Таблиця частотних характеристик другої моделі:');
disp(Table2);