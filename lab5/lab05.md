---
## Front matter
title: "Отчёт по лабораторной работе №5"


Математическое моделирование"
subtitle: "Модель «хищник-жертва». Вариант №20"
author: "Выполнил: Негматуллаев Бежан Шухратович, 


НФИбд-02-21, 1032215469"



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

Изучить взаимодействие двух видов типа "хищник - жертва" - модель Лотки-Вольтерры.

# Теоретическое введение

- Численность популяции жертв x и хищников y зависят только от времени (модель не учитывает пространственное распределение популяции на занимаемой территории)

- В отсутствии взаимодействия численность видов изменяется по модели Мальтуса, при этом число жертв увеличивается, а число хищников падает

- Естественная смертность жертвы и естественная рождаемость хищника считаются несущественными

- Скорость роста численности жертв уменьшается пропорционально численности хищников


# Задачи

1. Разобраться в модели Лотки-Вольтерры

2. Построить график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв 

3. Найти стационарное состояние системы

# Задание

Вариант 20:

Для модели «хищник-жертва»:

(Screens/1.png)

Постройте график зависимости численности хищников от численности жертв,
а также графики изменения численности хищников и численности жертв при
следующих начальных условиях:
x0 = 4, y0 = 13. Найдите стационарное
состояние системы.

# Выполнение лабораторной работы

## Построение математической модели. Решение с помощью программ

### Julia

Код программы для первого случая:

```
using Plots
using DifferentialEquations

x0 = 6
y0 = 14

a = 0.61
b = 0.41
c = 0.051
d = 0.031


function ode_fn(du, u, p, t)
    x, y = u
    du[1] = -a*u[1] + c * u[1] * u[2]
    du[2] = b * u[2] - d * u[1] * u[2]
end

v0 = [x0, y0]
tspan = (0.0, 60.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax=0.05)
X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi=300,
  legend=false)

plot!(
  plt,
  X,
  Y,
  label="Зависимость численности хищников от численности жертв",
  color=:blue)

savefig(plt, "julia1-1.png")

plt2 = plot(
  dpi=300,
  legend=true)

plot!(
  plt2,
  T,
  X,
  label="Численность жертв",
  color=:green)

plot!(
  plt2,
  T,
  Y,
  label="Численность хищников",
  color=:red)

savefig(plt2, "julia1-2.png")
```
Код программы для второго случая:

```
using Plots
using DifferentialEquations

a = 0.61
b = 0.41
c = 0.051
d = 0.031

x0 = c / d 
y0 = a / b

function ode_fn(du, u, p, t)
    x, y = u
    du[1] = -a*u[1] + c * u[1] * u[2]
    du[2] = b * u[2] - d * u[1] * u[2]
end

v0 = [x0, y0]
tspan = (0.0, 60.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax=0.05)
X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt2 = plot(
  dpi=300,
  legend=true)

plot!(
  plt2,
  T,
  X,
  label="Численность жертв",
  color=:green)

plot!(
  plt2,
  T,
  Y,
  label="Численность хищников",
  color=:red)

savefig(plt2, "julia2.png")
```


### Результаты работы кода на Julia

Первый случай: 

Графики изменения численности хищников и численности жертв при следующих начальных условиях

!["График изменения численности хищников на языке Julia"](Screens/julia1-1.png){#fig:001}

!["графики изменения численности жертв на языке Julia"](Screens/julia1-2.png){#fig:002}


Второй случай:

График зависимости численности хищников от численности жертв

!["График зависимости численности хищников от численности жертв на языке Julia"](Screens/julia2.png){#fig:003}

# Вывод

В ходе выполнения лабораторной работы были построены графики изменения численности хищников и численности жертв при начальных условиях, а также график зависимости численности хищников от численности жертв