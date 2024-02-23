---
## Front matter
title: "Отчёт по лабораторной работе №3


Математическое моделирование"
subtitle: "Модель боевых действий. Вариант №20"
author: Негматуллаев Бежан Шухартович

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: Times New Roman
romanfont: Times New Roman
sansfont: Times New Roman
monofont: Times New Roman
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Изучить модели боевых действий Ланчестера. Применить их на практике для решения задания лабораторной работы.

# Теоретическое введение

Законы Ланчестера (законы Осипова — Ланчестера) — математическая формула для расчета относительных сил пары сражающихся сторон — подразделений вооруженных сил
- В противоборстве могут принимать участие как регулярные войска,
так и партизанские отряды. В общем случае главной характеристикой соперников
являются численности сторон. Если в какой-то момент времени одна из
численностей обращается в нуль, то данная сторона считается проигравшей (при
условии, что численность другой стороны в данный момент положительна).

Рассмотривается три случая ведения боевых действий:

1. Боевые действия между регулярными войсками

2. Боевые действия с участием регулярных войск и партизанских отрядов

3. Боевые действия между партизанскими отрядами

# Задание

Между страной Х и страной У идет война. Численность состава войск исчисляется от начала войны, и являются временными функциями $x(t)$ и $y(t)$. В
начальный момент времени страна Х имеет армию численностью $500000$ человек, а в распоряжении страны У армия численностью в $500000$ человек. Для упрощения модели считаем, что коэффициенты $a$, $b$, $c$, $h$ постоянны. Также считаем $P(t)$ и $Q(t)$ непрерывными функциями.

Постройте графики изменения численности войск армии Х и армии У для следующих случаев:

1. Модель боевых действий между регулярными войсками:

$$ {dx\over {dt}} = -0.405x(t)-0.7y(t)+sin(t+1)+1 $$
$$ {dy\over {dt}} = -0.68x(t)-0.37y(t)+cos(t+2)+1$$

2. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов:

$$ {dx\over {dt}} = -0.304x(t)-0.78y(t)+2sin(2t)  $$
$$ {dy\over {dt}} = -0.68x(t)y(t)-0.2y(t)+2cos(2t)  $$

# Задачи

1. Построить модель боевых действий между регулярными войсками на языках Julia и OpenModelica
2. Построить модель ведения боевых действий с участием регулярных войск и
партизанских отрядов на языках Julia и OpenModelica

# Выполнение лабораторной работы

### Регулярная армия X против регулярной армии Y

Рассмотрим первый случай.
Численность регулярных войск определяется тремя факторами:

1. Cкорость уменьшения численности войск из-за причин, не связанных с боевыми действиями (болезни, травмы, дезертирство);
2. Cкорость потерь, обусловленных боевыми действиями противоборствующих сторон (что связанно с качеством стратегии, уровнем вооружения, профессионализмом солдат и т.п.);
3. Cкорость поступления подкрепления (задаётся некоторой функцией от времени).

В этом случае модель боевых действий между регулярными войсками описывается следующим образом:

$$ {dx\over {dt}} = -a(t)x(t)-b(t)y(t)+P(t) $$
$$ {dy\over {dt}} = -c(t)x(t)-h(t)y(t)+Q(t) $$

В первом пункте нами рассматривается как раз такая модель. Она является доработанной моделью Ланчестера, так его изначальная модель учитывала лишь члены $b(t)y(t)$ и $c(t)x(t)$, то есть, на потери за промежуток времени влияли лишь численность армий и "эффективность оружия" (коэффициенты $b(t)$ и $c(t)$).

$$ {dx\over {dt}} = -ax(t)-by(t)+P(t) $$
$$ {dy\over {dt}} = -cx(t)-hy(t)+Q(t) $$

Именно эти уравнения [3] и будут решать наши программы для выполнения первой части задания. В конце мы получим график кривой в декартовых координатах, где по оси $ox$ будет отображаться численность армии государства X, по оси $oy$ будет отображаться соответствующая численность армии Y. По тому, с какой осью пересечётся график, можно определить исход войны. Если ось $ox$ будет пересечена в положительных значениях, победа будет на стороне армии государства X (так как при таком раскладе численность армии Y достигла нуля при положительном значении численности армии X). Аналогичная ситуация для оси $oy$ и победы армии государства Y.

### Регулярная армия X против партизанской армии Y

Для второй части задания, то есть, для моделирования боевых действий между регулярной армией и партизанской армией, необходимо внести поправки в предыдущую модель. Считается, что темп потерь партизан, проводящих свои операции в разных местах на некоторой известной территории, пропорционален не только численности армейских соединений, но и численности самих партизан.

$$ {dx\over {dt}} = -a(t)x(t)-b(t)y(t)+P(t) $$
$$ {dy\over {dt}} = -c(t)x(t)y(t)-h(t)y(t)+Q(t) $$

Коэффициенты $a$, $b$, $c$ и $h$ всё так же будут положительными десятичными числами:

$$ {dx\over {dt}} = -ax(t)-by(t)+P(t) $$
$$ {dy\over {dt}} = -cx(t)y(t)-hy(t)+Q(t) $$


## Решение с помощью программ

### Julia

#### Программный код решения на Julia [1]

Код программы:

Случай сражения регулярная армия против регулярной армии.

```
using Plots
using DifferentialEquations
#X army quantity
x0 = 27300
#Y army quantity
y0 = 20400

a = 0.405 # army X casualties factor
b = 0.7 # Y army efficiency
c = 0.68 # X army efficiency
h = 0.37 # army Y casualties factor

p = (a, b, c, h)
quantity = [x0,y0] 

P(t) = sin(t+8)
Q(t) = cos(t+6)

#differential system
function rr_warfare(dF,u,p,t)
    a, b, c, h = p
    dF[1] = -a * u[1] - b * u[2] + P(t) + 1
    dF[2] = -c * u[1] - h * u[2] + Q(t) + 1
end

v0 = [0,4]

problem = ODEProblem(rr_warfare,quantity,v0,p)
solution = solve(problem)

A1 = [u[1] for u in solution.u]
A2 = [u[2] for u in solution.u]
T1 = [t for t in solution.t]


plt1 = plot(dpi = 300, legend= true, bg =:white)
plot!(plt1, xlabel="Время", ylabel="Численность", title="Модель боевых действий - Регулярные армии", legend=:outerbottom)
plot!(plt1, T1, A1, label="Численность армии X", color =:red)
plot!(plt1, T1, A2, label="Численность армии Y", color =:green)
savefig(plt1, "lab03_1.png")
```

Случай сражения регулярной армии против партизан.
```
using Plots
using DifferentialEquations

x0 = 27300
y0 = 20400
t0 = 0

a = 0.304 # army X casualties factor
b = 0.78 # Y army efficiency
c = 0.2 # X army efficiency
h = 0.68 # army Y casualties factor

p = (a, b, c, h)
quantity = [x0,y0]

P(t) = 2*sin(2*t)
Q(t) = 2*cos(2*t)

#differential system
function rr_warfare(dF,u,p,t)
    a, b, c, h = p
    dF[1] = -a * u[1] - b * u[2] + P(t) 
    dF[2] = -c * u[1] * u[2] - h * u[2] + Q(t) 
end

T = [0.0,0.0005] 

problem = ODEProblem(rr_warfare,quantity,T,p)
solution = solve(problem, dtmax = 0.000001)

A1 = [u[1] for u in solution.u]
A2 = [u[2] for u in solution.u]
T1 = [t for t in solution.t]


plt1 = plot(dpi = 300, legend= true, bg =:white)
plot!(plt1, xlabel="Время", ylabel="Численность", title="Модель Регулярная армия vs Партизаны", legend=:outerbottom)
plot!(plt1, T1, A1, label="Численность армии X", color =:red)
plot!(plt1, T1, A2, label="Численность армии Y", color =:green)
savefig(plt1, "lab03_2.png")
```

### Результаты работы кода на Julia

На рис. @fig:001 и @fig:002 изображены итоговые графики для обоих случаев.

!["График в Julia. Первый случай"](Screens/lab03_1.png){#fig:001}

!["График в Julia. Второй случай"](Screens/lab03_2.png){#fig:002}

### Программный код решения на OpenModelica [2]

Случай сражения регулярная армия против регулярной армии.
```
model lab3 "Battle between forces"
parameter Integer x0 = 500000;
parameter Integer y0 = 500000;
parameter Real a = 0.45;
parameter Real b = 0.86;
parameter Real c = 0.73;
parameter Real h = 0.49;
Real P;
Real Q;
Real x(start=x0);
Real y(start=y0);
equation
P = sin(time + 1);
Q = sin(time + 2);
der(x) = - a * x - b * y + P;
der(y) = - c * x - h * y + Q;
end lab3;
```

Случай сражения регулярной армии против партизан.
```
model lab3 "Battle between forces"
parameter Integer x0 = 500000;
parameter Integer y0 = 500000;
parameter Real a = 0.17;
parameter Real b = 0.65;
parameter Real c = 0.28;
parameter Real h = 0.31;
Real P;
Real Q;
Real x(start=x0);
Real y(start=y0);
equation
P = sin(2*time);
Q = sin(time);
der(x) = - a * x - b * y + P + 2;
der(y) = - c * x * y - h * y + Q + 2;
end lab3;
```

# Вывод

Были изучены модели боевых действий Ланкастера. В результате были получены графики для двух случаев боевых действий.

# Список литературы. Библиография

[1] Документация по Julia: https://docs.julialang.org/en/v1/

[2] Документация по OpenModelica: https://openmodelica.org/

[3] Решение дифференциальных уравнений: https://www.wolframalpha.com/

[4] Законы Ланчестера: https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%D1%8B_%D0%9E%D1%81%D0%B8%D0%BF%D0%BE%D0%B2%D0%B0_%E2%80%94_%D0%9B%D0%B0%D0%BD%D1%87%D0%B5%D1%81%D1%82%D0%B5%D1%80%D0%B0