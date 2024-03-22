# py31_alpine_doc2pdf_image_to_text

+ `git clone https://github.com/AlexanderSipko/py31_alpine_doc2pdf_image_to_text.git`
+ `branch main`
+ `cd doc2pdf`
+ `sudo docker build -t py31_alpine_doc2pdf_image_to_text .`
+ `sudo docker run -it -v ./app:/app py31_alpine_doc2pdf_image_to_text`

+ ! важно указать `VOLUME` том при запуске контейнер, результат будет сохранен в директории проекта
+ ! `start.sh` инициализирует запуск скрипта внутри контейнера
+ ! `FILE_PATH_IMAGE = 'input_image'` - исходные файлы примеры для извлечения текста
+ ! `FILE_PATH_DOCX = 'input_docx'` - исходные файлы примеры для преобразования в `pdf`
+ ! __result__ `FILE_OUTPUT` - результат работы скрипта, по умолчанию папка `./app/output`

## Action

+ build action

## inform

+ `main.py` - logic
+ `start.sh` - `bach command`
+ `requirements.txt` - `зависимости python`
+ tr

__Thanks to: JannisHajda Jannis Hajda__
