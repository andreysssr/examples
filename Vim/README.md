<!-- 
 *   https://github.com/andreysssr/examples
-->

# Vim

[Выход](#exit)  
[Общее](#general)  
[Перемещение курсора](#go)  
[Режим вставки - вставка/добавление текста](#insert)  
[Редактирование](#edit)  
[Выделение текста (визуальный режим)](#select)  
[Визуальные команды](#view)  
[Регистры](#registers)  
[Метки](#tag)  
[Вырезать и вставить](#cut_paste)  
[Выход и сохранение](#exit_save)  
[Поиск и замена](#searsh_replace)  
[Сворачивание](#collapse)  
[Работа с несколькими файлами](#multiple_files)  
[Вкладки](#tabs)  


<a name="exit"><h2>Выход</h2></a>
```bash
# Нажатия кнопок
ESC   # переход в командный режим
i     # переход в режим редактирования текста
ZQ    #(зажат Shift, поочередное нажатие) - выход без сохранения
ZZ    #(зажат Shift, поочередное нажатие) - сохранить и выйти

# Нажатия кнопок
ESC   # переход в командный режим
i     # переход в режим редактирования текста
ZQ    #(зажат Shift, поочередное нажатие) - выход без сохранения
ZZ    #(зажат Shift, поочередное нажатие) - сохранить и выйти

# Ввод в командном режиме
:q!             # выйти без сохранения
:wq             # сохранить файл и выйти
:w filename.txt # сохранить файл как filename.txt
```

<a name="general"><h2>Общее</h2></a>
```
:help keyword   # открыть помощь по ключевому слову
:o file     # открыть file
:sav file   # сохранить весь текщий буфер как file
:close      # закрыть текущую панель
K           # открыть справочное руководство для слова под курсором
```

<a name="go"><h2>Перемещение курсора</h2></a>
```
h   # передвинуть курсор влево
j   # передвинуть курсор на одну фактическую строку вниз
k   # передвинуть курсор на одну фактическую строку вверх
l   # передвинуть курсор вправо
gj  # передвинуть курсор на одну видимую строку вниз
gk  # передвинуть курсор на одну видимую строку вверх
H   # переместиться к началу экрана
M   # переместиться к середине экрана
L   # переместиться к концу экрана
w   # переместиться вперед на начало слова
W   # переместиться вперед на начало слова (слово может содержать пунктуацию)
e   # переместиться вперед на конец слова
E   # переместиться вперед на конец слова (слово может содержать пунктуацию)
b   # переместиться назад на начало слова
B   # переместиться назад на начало слова (слово может содержать пунктуацию)
%   # переместиться к парному символу (по умолчанию поддерживаются: '()', '{}', '[]' - подробнее по команде :h matchpairs в vim)
0   # переместиться на начало строки
^   # переместиться на первый непробельный символ строки
$   # переместиться на конец строки
g_  # переместиться к последнему непустому символу в строке
gg  # переместиться на первую строку документа
G   # переместиться на последнюю строку документа
5G  # переместить на пятую строку
fx  # переместиться к следующему вхождению символа x в текущей строке
tx  # установить курсор за следующим вхождением символа x в строке
Fx  # переместиться на предыдущее вхождение символа x в текущей строке
Tx  # установить курсор за предыдущим вхождением символа x в строке
;   # повторить предыдущее f, t, F или T перемещение
,   # повторить предыдущее f, t, F или T перемещение, в обратном направлении
}   # переместиться к следующему параграфу (или функции/блоку при редактировании кода)
{   # переместиться к предыдущему параграфу (или функции/блоку при редактировании кода)
zz  # сдвинуть весь буфер по вертикали вместе с курсором, так чтобы курсор оказался в центре

Ctrl + b    # переместиться назад на целый экран
Ctrl + f    # переместиться вперед на целый экран
Ctrl + d    # переместиться вперед на половину экрана
Ctrl + u    # переместиться назад на половину экрана
```

<a name="insert"><h2>Режим вставки - вставка/добавление текста</h2></a>
```
i   # вставка перед курсором
I   # вставка в начало строки
a   # вставка (добавление) после курсора
A   # вставка (добавление) в конец строки
o   # добавление новой строки под текущей
O   # добавление новой строки над текущей
ea  # вставка (добавление) после конца слова
Esc # выход из режима вставки
```

<a name="edit"><h2>Редактирование</h2></a>
```
r   # заменить один символ
J   # присоединить нижнюю строку к текущей
cc  # заменить всю строку
cw  # заменить всё текущее слово
c$  # заменить до конца строки
s   # удалить символ и заменить текст
S   # удалить строку и заменить текст (то же что cc)
xp  # переставить две буквы (удалить и вставить)
u   # отменить
.   # повторить последнюю команду
Ctrl + r # применить последнее отменённое изменение
```

<a name="select"><h2>Выделение текста (визуальный режим)</h2></a>
```
v   # включить режим выделения текста, выделить строки, затем выполнить команду (например, копирование)
V   # включить построчный режим выделения
o   # переместиться на другой конец выделенной области
Ctrl + v  # включить режим выделения блоков
O   # переместить на другой угол блока
aw  # выделить слово
ab  # блок в ()
aB  # блок в {}
ib  # внутренний блок в ()
iB  # внутренний блок в {}
Esc # выйти из режима выделения текста
```

<a name="view"><h2>Визуальные команды</h2></a>
```
>   # сместить текст вправо
<   # сместить текст влево
y   # скопировать выделенный текст
d   # удалить выделенный текст
~   # переключить регистр
```

<a name="registers"><h2>Регистры</h2></a>
```
:reg # показать содержимое регистров
"xy  # поместить содержимое в регистр x
"xp  # вставить содержимое регистра x
```

<a name="tag"><h2>Метки</h2></a>
```
:marks  # список меток
ma      # установить метку A на текущей позиции
`a      # переместиться к метке A
y`a     # скопировать до метки A
```

<a name="cut_paste"><h2>Вырезать и вставить</h2></a>
```
yy  # скопировать строку
2yy # скопировать 2 строки
yw  # скопировать слово
y$  # скопировать до конца строки
p   # вставить буфер обмена после курсора
P   # вставить буфер обмена перед курсором
dd  # удалить (вырезать) строку
2dd # удалить (вырезать) 2 строки
dw  # удалить (вырезать) слово
D   # удалить (вырезать) до конца строки
d$  # удалить (вырезать) до конца строки
x   # удалить (вырезать) символ
```

<a name="exit_save"><h2>Выход и сохранение</h2></a>
```
:w !sudo tee %  # сохранить файл с sudo
:w  # сохранить файл, но не выходить
:wq # сохранить файл и выйти
:x  # сохранить файл и выйти
ZZ  # сохранить файл и выйти

:q  # выйти (терпит неудачу в случае несохраненных изменений)
:q! # выйти без сохранения
ZQ  # выйти без сохранения
```

<a name="searsh_replace"><h2>Поиск и замена</h2></a>
```
/pattern        # поиск шаблона
?pattern        # обратный поиск шаблона
\vpattern       # 'very magic' режим: все не алфавитно - цифровые символы интерпретируются как специальные (экранирование не требуется)
n               # повторить поиск в том же направлении
N               # повторить поиск в обратном направлении
:%s/old/new/g   # заменить все вхождения шаблона в файл на указанное значение
:%s/old/new/gc  # заменить все вхождения шаблона в файл на указанное значение с подтверждением
:noh            # отключить подсвечивание результатов поиска
```

<a name="collapse"><h2>Сворачивание</h2></a>
```
zf#j         # создает свертку от текущей позиции до # строк вниз
zf/подстрока # создает свертку от текущей позиции и до первой найденной подстроки
v/V и zf     # выделение блока и создание свертки

# Команды для управления:
zc  # свернуть блок
zo  # развернуть блок
zM  # закрыть все блоки
zR  # открыть все блоки
za  # инвертирование (если открыто – закрыть, если закрыто – открыть)
zj  # переход к следующей свертке
zk  # переход к предыдущей свертке
zd  # удалить свертку под курсором
zD  # удалить все свертки
[z  # перейти к началу текущей свертки
]z  # перейти к концу текущей свертки
```

<a name="multiple_files"><h2>Работа с несколькими файлами</h2></a>
```
:e file     # редактировать файл в новом буфере
:bnext либо :bn     # перейти к следующему буферу
:bprev либо :bp     # перейти к предыдущему буферу
:bd         # удалить буфер (закрыть файл)
:ls         # список всех открытых буферов
:sp file    # открыть файл в новом буфере и разделить окно
:vsp file   # открыть файл в новом буфере и вертикально разделить окно
Ctrl + ws   # разделить окно
Ctrl + ww   # переключение окон
Ctrl + wq   # закрыть окно
Ctrl + wv   # разделить окно вертикально
Ctrl + wh   # переместить курсор в левое окно (вертикально разделение)
Ctrl + wl   # переместить курсор в правое окно (вертикальное разделение)
Ctrl + wj   # переместить курсор в окно ниже (горизонтальное разделение)
Ctrl + wk   # переместить курсор в окно выше (горизонтальное разделение)
```

<a name="tabs"><h2>Вкладки</h2></a>
```
:tabnew         # открыть файл в новой вкладке
:tabnew file    # открыть файл в новой вкладке
Ctrl + wT       # переместить текущее окно в собственную вкладку

gt          # переключиться на следующую вкладку
:tabnext    # переключиться на следующую вкладку
:tabn       # переключиться на следующую вкладку

gT          # переключиться на предыдущую вкладку
:tabprev    # переключиться на предыдущую вкладку
:tabp       # переключиться на предыдущую вкладку
#gt         # переключить на вкладку номер #

:tabmove #            # переместить текущую вкладку на # позицию (нумерация с 0)
:tabclose либо :tabc  # закрыть текущую вкладку и все её окна
:tabonly либо :tabo   # закрыть все вкладки кроме текущей
:tabdo command        # выполнить command на всех вкладках (к примеру :tabdo q - закрывает все открытые вкладки)
```