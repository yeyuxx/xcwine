1. ВВЕДЕНИЕ

Wine - это программа, которая позволяет запускать программы Microsoft
Windows (включая исполняемые файлы формата DOS, Windows 3.x, Win32 и
Win64) на Unix. Она состоит из загрузчика, загружающего и выполняющего
программы Microsoft Windows, и библиотеки (Winelib), которая реализует
вызовы Windows API, используя их Unix- или X11-эквиваленты. Библиотека
также может быть использована для портирования кода Win32 в среду Unix.

Wine - свободное программное обеспечение, опубликованное по лицензии
GNU LGPL, файл LICENSE содержит информацию по лицензии.


2. БЫСТРЫЙ СТАРТ

В каталоге, содержащем исходный код Wine, выполните:

./configure
make

Запустите программу с помощью команды «wine имя_программы». Источники
дополнительной информации перечислены в конце этого файла. Ознакомьтесь с
руководством по Wine, а также с сайтом https://www.winehq.org.


3. ТРЕБОВАНИЯ

Компиляция и запуск Wine поддерживается в следующих операционных системах:

  Linux версии 2.0.36 или более новой
  FreeBSD 8.0 или более новой
  Solaris x86 9 или более новой
  NetBSD-текущей версии
  Mac OS X 10.8 или более новой

Так как Wine требует для запуска поддержку потоков на уровне ядра,
поддерживаются только операционные системы, перечисленные выше. Другие
операционные системы с поддержкой многопоточности на уровне ядра
возможно будут поддерживаться Wine в будущем.

FreeBSD:
  Wine не будет работать как следует на версиях ниже, чем FreeBSD 8.0.
  Посетите <https://wiki.freebsd.org/Wine> для дополнительной информации.

Solaris:
  Лучше всего компоновать Wine инструментами GNU
  (gcc, gas, и т.д.). Внимание: установка gas *НЕ* гарантирует
  что gcc будет его использовать. Необходимо перекомпилировать gcc после
  установки gas или создать ссылку на cc, как и на ld в инструментах gnu.

NetBSD:
  Убедитесь что, параметры USER_LDT, SYSVSHM, SYSVSEM и SYSVMSG
  включены в вашем ядре.

Mac OS X:
  Вам потребуется Xcode/Xcode Command Line Tools или Apple cctools.
  Минимальные требования для компиляции это clang 3.8 c MacOSX10.10.sdk и
  mingw-w64 v8. MacOSX10.14.sdk и новее может использоваться только для
  сборки wine64.

Поддерживаемые файловые системы:
  Wine должен работать на большинстве файловых систем. При использовании файлов
  через Samba возможны некоторые проблемы с совместимостью. NTFS не обладает
  необходимой функциональностью для запуска некоторых приложений.
  Рекомендуется использовать родные файловые системы Unix.

Базовые требования:
  У вас должны быть установлены заголовочные файлы X11
  (xorg-dev в Debian и libX11-devel в Red Hat).

  Разумеется, вам необходим «make» (лучше всего использовать GNU make).

  Вам также понадобятся flex версии 2.5.33 или более новой и bison.

Дополнительные библиотеки:
  Конфигурационный скрипт выведет список дополнительных библиотек, которые не были
  найдены в вашей системе. Ознакомьтесь с перечнем необходимых пакетов по адресу
  https://wiki.winehq.org/Recommended_Packages. При работе на 64-битных платформах
  убедитесь, что у вас установлены 32-битные версии этих библиотек.

4. КОМПИЛЯЦИЯ

Для компиляции, выполните:

./configure
make

В результате вы получите программу «wine», библиотеки и бинарные файлы,
необходимые для работы Wine.
Программа «wine» нужна для загрузки и выполнения программ Windows.
Библиотека «libwine» («Winelib») может быть использована для компилирования и
компоновки исходного кода Windows под Unix.

Для вывода конфигурационных настроек введите ./configure --help.

За дополнительной информацией обратитесь к https://wiki.winehq.org/Building_Wine


5. УСТАНОВКА

Если компоновка Wine завершилась успешно, выполните «make install». Это
установит исполняемые файлы wine, руководство Wine и некоторые
необходимые файлы.

Сначала не забудьте удалить любые конфликтующие версии Wine установленные ранее.
Попробуйте «dpkg -r wine», «rpm -e wine» или «make uninstall» до установки.

После установки запустите конфигурационную программу «winecfg». Посетите
Службу поддержки на https://www.winehq.org/, если возникнут вопросы по конфигурации.


6. ЗАПУСК ПРОГРАММ

Вы можете указывать путь до файла или только имя файла.

Например: запуск Блокнота:

	wine notepad		   (используя пути, сохранённые
	wine notepad.exe	    в реестре, для нахождения файла)

	wine c:\\windows\\notepad.exe  (используя синтаксис DOS)

	wine ~/.wine/drive_c/windows/notepad.exe  (используя синтаксис Unix)

        wine notepad.exe /parameter1 -parameter2 parameter3
				   (вызов программы с параметрами)

Wine не идеален, поэтом некоторые программы могут завершаться с ошибкой.
Полученный в результате ошибке текстовый лог необходимо приложить к отчету
об ошибке.


7. ПОЛУЧЕНИЕ ДОПОЛНИТЕЛЬНОЙ ИНФОРМАЦИИ

WWW:	 Много информации о Wine доступно в WineHQ на
	 https://www.winehq.org/: различные руководства Wine, база данных приложений,
	 база данных ошибок. Вероятно лучше всего начать с этого сайта.

FAQ:	 Wine FAQ расположен на https://www.winehq.org/FAQ

Wiki:	 Wine Wiki расположен на https://wiki.winehq.org

Рассылки:
	 Имеется несколько рассылок для пользователей и разработчиков Wine,
	 обратитесь по адресу https://www.winehq.org/forums за дополнительной информацией.

Ошибки:	 Сообщайте об ошибках в Wine Bugzilla по адресу https://bugs.winehq.org
	 Прежде чем отправлять сообщение об ошибке проверьте, может эта ошибка
	 уже известна или исправлена в последней версии Wine.

IRC:	 Онлайн помощь доступна на канале #WineHQ на irc.libera.chat.

Git:	 Текущие разработки Wine доступны через Git.
	 Смотрите https://www.winehq.org/site/git для дополнительной информации.

Если вы что-то добавили или исправили ошибку, пожалуйста отправьте патч
(предпочтительно сгенерированный с помощью git-format-patch) на wine-devel@winehq.org
для его включения в следующий релиз.

--
Alexandre Julliard
julliard@winehq.org

Перевели на русский язык
Владимир Панкратов
scriptkid@mail.ru
Виталий Липатов
lav@etersoft.ru
