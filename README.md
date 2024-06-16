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

![change-filetype-task](./images/change_filetype_task.png)

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

## Задание 2. Выдача временных штампов

![files-timestamps](./images/files-timestamps.png)

```Amber
import {len, exit, file_exist} from "std";

main(args) {
	loop i, arg in args {
		if not file_exist(arg) {
			echo "Файл {arg} не существует!";
		} else {
			let date_of_birth = unsafe $stat -c %w {arg}$;
        		let date_of_modification = unsafe $stat -c %y {arg}$;
        		let date_of_change = unsafe $stat -c %z {arg}$;
        		echo "Дата создания файла {arg} - {date_of_birth}";
        		echo "Дата модификации файла {arg} - {date_of_modification}";
        		echo "Дата изменения файла {arg} - {date_of_change}";
			echo "---------------------";
		}
	}
}
```

unsafe говорит о том, что не нужно ловить неправильные поведения команды (в данном случае stat).

stat -c %w - выводит только дату создания файла

stat -c %y - выводит только дату модификации файла

stat -c %z - выводит только дату изменений файла

Подробнее [manual stat](https://man7.org/linux/man-pages/man1/stat.1.html).

## References

Ссылка на [исходный код](https://github.com/Ph0enixKM/Amber) и [документацию](https://docs.amber-lang.com).
