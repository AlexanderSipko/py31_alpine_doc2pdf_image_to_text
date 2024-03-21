from subprocess import Popen, PIPE
import glob
import time
from PIL import Image
import pytesseract

FILE_PATH_IMAGE = 'input_image'
FILE_PATH_DOCX = 'input_docx'
FILE_OUTPUT = 'output'

# format file
types = ['doc', 'docx', 'pptx', 'ppt']
types_images = ['jpeg', 'img', 'jpg', 'png', 'gif']

COLORED = {
    "GREEN":'\x1b[6;30;42m',
    "STANDARD":'\x1b[0m'
}

def convert_file_name(file, types, new_suffix='pdf'):
    for i in types:
        if file.endswith(i):
            return file.replace(i, new_suffix)
        
# libreoffice
files = []
for type in types:
    files.extend(glob.glob(f'./{FILE_PATH_DOCX}/*.' + type))

for file in files:
    p = Popen(['soffice', '--headless', '--convert-to', 'pdf',
                file, '--outdir', f'./{FILE_OUTPUT}'],
                stdout=PIPE, stderr=PIPE
                )
    output, error = p.communicate()
    if p.returncode != 0:
        print("Не смог конвертировать файл: %d %s %s" % (file, output, error))
    
    print(COLORED['GREEN'] + "Ok %s ==> %s" % (
        file,
        convert_file_name(file, types))
        + COLORED['STANDARD'] 
        )
    
# tesseract
files_images = []
print("==> Извлечение текста из фото")
for type in types_images:
    files_images.extend(glob.glob(f'./{FILE_PATH_IMAGE}/*.' + type))
print('==> pytesseract -version', pytesseract.get_tesseract_version())
print('==> pytesseract -language data', pytesseract.get_languages(config='')) 

for file in files_images:
    text = pytesseract.image_to_string(file, lang='rus')

    new_name_file = './' + FILE_OUTPUT + '/' + convert_file_name(file.split('/')[-1], types_images, 'txt')
    with open(new_name_file, 'w', encoding='utf-8') as f:
        f.write(text)
        
    print(COLORED['GREEN'] + "Ok Извлечение данных из %s ==> %s" % (
        file,
        new_name_file
        ) + COLORED['STANDARD'])

