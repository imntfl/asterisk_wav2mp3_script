# Добавьте скрипт в cron например на 59 мин
# */59 * * * * /usr/local/bin/mp3.sh

#!/bin/bash

# проверка есть ли компонент lame
if ! command -v lame &> /dev/null; then
    echo "Error: lame is not installed."
    exit 1
fi

# каталог записей
records_dir="/records/"

# поиск файлов записей в формате WAV с подкаталогами
find "$records_dir" -type f -name "*.wav" | while read -r wav_file; do
    mp3_file="${wav_file%.wav}.mp3"
    mkdir -p "$(dirname "$mp3_file")"

# конвертация с выводом сообщения
    echo "Converting $wav_file to $mp3_file"
    lame -V 2 "$wav_file" "$mp3_file"

# условия завершение скрипта
    if [ $? -eq 0 ]; then
        echo "Conversion successful"
# удаление оригиналов
        rm "$wav_file"
        echo "Original WAV file removed"
# вывод ошибки конвертирования
    else
        echo "Error converting $wav_file"
    fi
done

echo "Conversion complete"
