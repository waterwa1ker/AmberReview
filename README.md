# AmberReview

![Static Badge](https://img.shields.io/badge/Amber-blue)

Для обзора данного языка выполним [несколько заданий](http://www.astro.spbu.ru/sites/default/files/training_problems.pdf) для bash скриптов, используя Amber.

## Установка

Amber доступен только на Linux/MacOS. Про установку [подробнее](https://docs.amber-lang.com/getting_started/installation).

## Запуск скриптов

В корневой директории файла есть Makefile, который поможет вам собрать все скрипты (ниже запускать первого скрипта):

```bash
make
./change_filetype/output.sh change_filetype/test.log txt
```

Очистка всех .sh файлов, полученных в процессе компиляции .ab файлов:

```bash
make clean
```


## Задание 1. Смена расширения файла

```Amber
import {len, file_exist, exit, split} from "std"

main (args) {
	if len(args) != 2 {
		echo "Неправильное количество аргументов";
		exit(1);
	}
	let filename = args[0];
	let filetype = args[1];
	if not file_exist(filename){
		echo "Файл не существует";
		exit(1);
	}
	let splited = split(filename, ".");
	$mv {filename} {splited[0]}.{filetype}$ failed {
		echo "Не удалось конвертировать на расширение {filetype}";
	}	
}
```

Здесь ничего сложного нет, считываем полное имя файла (например, test.log в директории change_filetype) и новое расширение файла. Есть проверки на существование файла, количество аргументов. Переименование файла происходит с помощью **mv {old_filename} {new_filename}**.



## References

Ссылка на [исходный код](https://github.com/Ph0enixKM/Amber) и [документацию](https://docs.amber-lang.com).
