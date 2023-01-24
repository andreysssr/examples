<!-- 
 *   https://github.com/andreysssr/examples
-->

# Editorconfig

`.editorconfig` - настройка для всех редакторов
 
Каждый `.editorconfig` должен быть в кодировке `UTF-8`, а в конце строк должно быть либо `CRLF` либо `LF`

В качестве имени секции выступает маска файлов, например `[*.js]` или `[index.html]`

Каждый комментарий должен быть на отдельной строке и начинаться с `;` или `#`.

Ниже приведен пример файла `.editorconfig`, в котором задаются стили

```editorconfig
# EditorConfig is awesome: https://EditorConfig.org

# Корневой файл EditorConfig - находится в корне проекта
root = true

# Для всех файлов используем unix-совместимые переносы строк
[*]
indent_style = space
indent_size = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

# отступы в 4 пробела
[*.py]
indent_style = space
indent_size = 4

[Makefile]
indent_style = tab

# Используем табы для отступов (Не указываем размер)
[*.js]
indent_style = tab

# Перезависываем настройку отступов для js файлов в папке lib
[lib/**.js]
indent_style = space
indent_size = 2

#  Только для файлов package.json or .travis.yml
[{package.json,.travis.yml}]
indent_style = space
indent_size = 2

# Не убирать пробелы в конце строк для файлов Markdown
[*.md]
trim_trailing_whitespace = false
```

## Описание настроек

```editorconfig
root = true
# Все настройки нечувствительны к регистру.
# Специальная настройка, которая должна быть на самом верху конфига. 
# Если установлена в true, парсер не будет искать другие конфиги в
# родительских папках (Подробности ниже).
# Значения: true, false

[*]
indent_style = tab
# Позволяет задать жесткую или мягкую табуляцию для отступов.
# Значения: tab, space

indent_size = 4
# Позволяет задать ширину отступа использовании мягкой табуляции.
# Значения: число - 2, 4

tab_width = 4
# Позволяет задать ширину отступа использовании жесткой табуляции. 
# Если не задано, возьмет значение из indent_size.
# Значения: число - 2, 4

end_of_line = lf
# Позволяет выбрать, что использовать на концах строк.
# Значения: lf, cr, crlf

charset = utf-8
# Позволяет выбрать кодировку для файлов. 
# Использовать utf-8-bom не рекомендуется
# Значения: latin1, utf-8, utf-8-bom, utf-16be, utf-16le

trim_trailing_whitespace = true
# Позволяет убрать пробелы из концов строк.
# Значения: true, false

insert_final_newline = true
# Позволяет убедиться, что в конце файла всегда будет новая строка.
# Значения: true, false

# Специальное значение Ignore
# Некоторые файлы, например сторонние библиотеки или минифицированные 
# файлы, лучше не трогать. В таких случаях для любой настройки можно 
# задать значение ignore. Например:

# Задаем форматирование для JS и CSS
[*.{js,css}]
indent_style = space
indent_size = 2

# Но не переформатируем минифицированные JS и CSS файлы.
[*.min.*]
indent_style = ignore
trim_trailing_whitespace = false
insert_final_newline = ignore
```

## Как работает поиск файлов по маске

```
* - Любое количество символов кроме разделителя пути (/)
    Пример: [*.js]
        hello.js // Совпадение
        hellojs // Нет совпадения
        index.html // Нет совпадения
        lib/source.js // Нет совпадения

** - Любое количество символов
    Пример: [**.js]
        hello.js // Совпадение
        hellojs // Нет совпадения
        index.html // Нет совпадения
        lib/source.js // Совпадение

? - Один любой символ
    Пример: [hell?.js]
        hello.js // Совпадение
        hell.js // Нет совпадения

[name] - Любой символ из символов содержащийся в “name”
    Пример: [[abc].js]
        a.js // Совпадение
        b.js // Совпадение
        abc.js // Нет совпадения

[!name] - Любой символ которого нету в “name”
    Пример: [file[!2468].js]
        file1.js // Совпадение
        file2.js // Нет совпадения

{s1,s2,s3} - Любая из строк разделенных запятыми
    Пример: [index.{js,html}]
        index.js // Совпадение
        index.html // Совпадение
        package.json // Нет совпадения

\ - Экранирование служебных символов
    Пример: [\[abc\].js]
        a.js // Нет совпадения
        [abc].js // Совпадение
```
