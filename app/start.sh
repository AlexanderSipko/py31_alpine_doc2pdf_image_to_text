#!/bin/sh
echo -en -e  "\033[0;33m ==> Start Conteiner ... \033[0m \n"
python3 -V
pip3 --version
echo -en -e  "\033[0;33m ==> Установленные библиотеки \033[0m \n"
pip3 list
echo -en -e  "\033[0;33m ==> Файлы в директории \033[0m \n"
ls
echo -en -e  "\033[0;33m ==> Запуск преобразования файлов \033[0m \n"
python3 main.py
