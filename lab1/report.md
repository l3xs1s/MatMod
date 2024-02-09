---
# Front matter
lang: ru-RU
title: "Лабораторная работа 1"
subtitle: "Гит и МД"
author: "Негматуллаев Бежан Шухратович"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---


# Цель работы

Ознакомление с системой ГИТ И МАРКДАУН


# Выполнение лабораторной работы

1.  Установка имени и электронной почты (рис. 1)

![Пункт 1](image/1.png){ #fig:001 width=90% }

2.  Параметры установки окончаний строк (рис. 2)

![Пункт 2](image/2.png){ #fig:002 width=90% }


3. Создание проекта

![Пункт 3](image/3.png){ #fig:003 width=90% }

4. Внесение изменений (рис. 4) 

![Пункт 4](./image/4.png){ #fig:004 width=90% }

5.  Индексация изменений (рис. 5)

![Пункт 5](image/5.png){ #fig:005 width=90% }

6.  Внесение изменений в коммиты(рис. 6)

![Пункт 6](image/6.png){ #fig:006 width=70% }

7. Подробнее о структуре (рис. 7)

![Пункт 7](image/7.png){ #fig:007 width=70% }

8. Перебазирование (рис. 8)

![Пункт 8](image/8.png){ #fig:008 width=70% }

9. Клонирование репозиториев (рис. 8)

![Пункт 9](image/9.png){ #fig:009 width=70% }

# Вывод

Ознакомились с системой контроля версий ГИТ

