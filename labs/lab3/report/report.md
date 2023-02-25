---
## Front matter
title: "Лабораторная работа №3"
subtitle: "Модель боевых действий"
author: "Го Чаопен"

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
lot: true # List of tables
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
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
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
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Построение моделей боевых действий на языках Julia и OpenModelica. Решение ОДУ 1 порядка с помощью графика. Рассмотрение модели боевых действий между регулярными войсками. Рассмотреть модель ведения боевых действий с участием регулярных войск и партизанских отрядов.

# Задание

Существуют три модели боя.

1. Модель боевых действий между регулярными войсками

2. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов

3. Модель боевых действий между партизанскими отрядами

Мы рассмотрим только первых две модели (1 и 2). Проверим, как работает модель в различных ситуациях, построим графики y(t) и x(t) в рассматриваемых случаях.

# Теоретическое введение

1. Модель боевых действий между регулярными войсками описывается следующим ОДУ:

>dx/dt = - ax(t) - bx(t) + P(t)  
>dy/dt = - cx(t) - hy(t) + Q(t)  
2. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов:

>dx/dt = - a(t)x(t) - b(t)x(t) + P(t)  
>dy/dt = - c(t)x(t)y(t) - h(t)y(t) + Q(t),

где: 
>a,b,c,h - постоянные коэффициенты  
>a(t), h(t) - коэффициенты, описывающие потери, не связанные с боевыми действиями  
>c(t), b(t) - коэффициенты, описывающие потери, связанные с боевыми действиями  
>P(t), Q(t) - функции, учитывающие возможность подхода подкрепления к войскам  

Подробнее о модели боевых действий в [@esystem-lab3;@lanchester]

# Выполнение лабораторной работы

Изучили теорию, приступаем к написанию кода на Julia. Решаем систему ОДУ [@juliaODE], строим график (рис. @fig:001).

![Код на Julia для модели 1](image/fig001.png){#fig:001 width=70%}

На первом графике мы видим - численность армии страны Y проигрывает (рис. @fig:002).

![Модель боевых действий между регулярными войсками на Julia](image/fig002.png){#fig:002 width=70%}

На втором графике проигрывает армия страны Y (рис. @fig:003) (рис. @fig:004).

![Код на Julia для модели 2](image/fig003.png){#fig:003 width=70%}

![Модель ведение боевых действий с участием регулярных войск и партизанских отрядов на Julia](image/fig004.png){#fig:004 width=70%}

Дальше переходим к написанию кода на OpenModelica. Решаем систему ОДУ [@openmodelicaODE] и получаем первую модель (рис. @fig:005).

![Код модели боевых действий между регулярными войсками на OpenModelica](image/fig005.png){#fig:005 width=70%}

Наша вторая модель (рис. @fig:006).

![Модель ведение боевых действий с участием регулярных войск и партизанских отрядов на OpenModelica](image/fig008.png){#fig:006 width=70%}

Делаем установку настроек симуляций (рис. @fig:007).

![Установка настроек симуляции модели боевых действий на OpenModelica](image/fig006.png){#fig:007 width=70%}


Получаем графики моделей боя (рис. @fig:008) (рис. @fig:009).

Графики похожи на графики в Julia, значит мы сделали все верно. Исходы боя получили аналогичным на Julia.

![Модель боевых действий между регулярными войсками на OpenModelica](image/fig007.png){#fig:008 width=70%}

На втором графике проигрывает армия Y (рис. @fig:009).

![Модель ведение боевых действий с участием регулярных войск и партизанских отрядов на OpenModelica](image/fig009.png){#fig:009 width=70%}

# Выводы

В ходе лабораторной работы были получены навыки работы с простейшими моделями боевых действий. Улучшены навыки работы с Julia и OpenModelica. Результат работы - графики, наглядко показывающие результат. Если сравнивать данные языки программирования, то для решения этой задачи OpenModelica кажется проще в реализации и быстрее в скорости выполнения. Очень удобный интерфейс, с которым получилось легко разобраться и работать.


# Список литературы{.unnumbered}


