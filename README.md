# asterisk_wav2mp3_script
# выполните в фоне скрипт- чтобы переконвертировать старые записи с АТС

# Защищает от завершения при разрыве SSH-сессии
# Сохраняет вывод в файл nohup.out

nohup ./mp3.sh &

# Проверить процесс:
ps aux | grep mp3.sh
