<!-- 
 *   https://github.com/andreysssr/examples

 *   http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html
-->

# Makefile

[Имена make-файлов по умолчанию](#makefile)  
[Выбрать другое имя make файла](#makefile_newname)  
[Комментарии в Makefile](#comment)  
[Структрута make файла](#structure)  
[Пример make файла](#example)  
[Перенос длинных команд на другую строку](#command_break)  
[Вызов исполнения цели](#exec_commands)  
[Присваивание значения переменным](#variables)  
[Обращение к переменным](#exec_variables)  
[Установка переменных в командной строке](#set_commandline_variables)  
[Подключение других файлов](#include)  
[Отключить вывод команды в терминале](#off_display_command)  
[Просмотр команды без реального выполнения](#show_command)  
[Условия выполнения](#if)  
[Итоговый makefile](#result_malefile)   

--- 
<a name="makefile"><h2>Имена make-файлов по умолчанию</h2></a>

- `makefile`
- `Makefile`

---

<a name="makefile_newname"><h2>Выбрать другое имя make файла</h2></a>

```
make -f make-dev
```
или
```
make --file=make-prod
```

---

<a name="comment"><h2>Комментарии в Makefile</h2></a>

```
# до конца строки будет считаться комментарием
```

---

<a name="structure"><h2>Структрута make файла</h2></a>

```
цели : пререквизиты
    команда
    команда
```
или так:

```
цели : пререквизиты ; команда
    команда
    команда
```

- `Цель (target)` представляет собой название группы команд, либо целей, либо целей и команд
- `Пререквизит` (prerequisite) - могут выступать другие цели
- `Команда` - это действие, выполняемое утилитой make. Это строка которую мы обычно пишем в bash терминале.

- В одной цели могут использоваться несколько команд
- Каждая команда прописывается на новой строке или на текущей после точки с запятой `;`

> Важное замечание: строки, содержащие команды обязательно должны начинаться с символа табуляции!  

---

<a name="example"><h2>Пример make файла</h2></a>

```
cleanall : cleanobj cleandiff
    rm program

cleanobj :
    rm *.o

cleandiff :
    rm *.diff
```

---

<a name="command_break"><h2>Перенос длинных команд на другую строку</h2></a>

Для повышения удобочитаемости, длинные строки можно переносить на следующую строку с помощью символа обратной косой черты ` \ `, за которым следует перевод строки.

После обратной черты не должно идти символов пробела.
```
objects = main.o kbd.o command.o display.o \
          insert.o search.o files.o utils.o
```

---

<a name="exec_commands"><h2>Вызов исполнения цели</h2></a>

```
make objects
```

>Если вызвать команду `make` без указания цели - тогда будет выполнена первая сверху описанная цель.

---

<a name="variables"><h2>Присваивание значения переменным</h2></a>

>Присваивание-переменной может быть любой допустимой формой оператора присваивания:
>- рекурсивной (`=`),
>- статической (`:=`),
>- дополняющей (`+=`),
>- условной (`?=`).
>- многострочные переменные

```
немедленно = отложенно
немедленно ?= отложенно
немедленно := немедленно
немедленно += отложенно или немедленно

define немедленно
    отложенно
endef
```

```
foo = params

bar := "next params"

foo += bar # foo получить значение "params next params"

foo ?= text # если в переменной foo уже присвоено значение - оно не изменится
```

Создание многострочной переменной `two-lines`
```
define two-lines
echo foo
echo $(bar)
endef
```

---
<a name="exec_variables"><h2>Обращение к переменным</h2></a>

```
$(foo)
```
или так
```
${foo}
```

---

<a name="set_commandline_variables"><h2>Установка переменных в командной строке</h2></a>

Аргумент командной строки, содержащий `=` определяет значение переменной: запись `v=x` означает, что переменная `v` получит значение `x`.

```
# в make файле переменной `dir` будет присвоено значение `storage`
make clean dir=storage
```

---

<a name="include"><h2>Подключение других файлов</h2></a>

```
include имена_файлов...
```

- В начале строки могут находится дополнительные пробелы - все они будут игнорированы.
- Наличие символа табуляции в начале строки недопустимо, поскольку такие строки make считает командами.
- Между словом `include` и началом списка файлов, а также между именами файлов необходим пробел. Лишние пробелы между именами, а также пробелы после конца директивы, игнорируются.

```
include .env
```

---

<a name="off_display_command"><h2>Отключить вывод команды в терминале</h2></a>

>Перед выполнением команды `make` выводит её в терминал. Чтобы отключить вывод команды - при написании команды перед ней ставиться символ `@`

```
# makefile

clean:
    @rm -R ./storage
```

---

<a name="show_command"><h2>Просмотр команды без реального выполнения </h2></a>

Для просмотра команды в терминале без реального выполнения применяется опция `-n`

```
make clean -n
```

---

<a name="if"><h2>Условия выполнения</h2></a>

Условия сравнения переменной `FOO` со значением `undefined`
функция origin возвращает значение переменной.
```
ifeq ($(origin FOO), undefined)
FOO = bar
endif
```
---
<a name="result_malefile"><h2>Итоговый makefile</h2></a>

```makefile
# это комментарий

include .env # подключаем файл

php = app   # устанавливаем переменную `php`

echo:
	@echo $(php)    # символ `@` в начале команды отключает её вывод в терминале

clear:
    -rm -R ./storage  # символ `-` в начале команды будет игнорировать ошибки и прд работу make

set_user_permit:
	@sudo chown -R $(USER):$(USER) $(CURDIR)

# команда (make create_model name=Posts) - создаст модель (Posts)
create_model: # make create_model name=[modelName]
	@docker-compose exec $(php) php artisan make:model Models/$(name) -m && make set_user_permit

set_user_permit:
	@sudo chown -R $(USER):$(USER) $(CURDIR)
```
