# Резервное копирование PostgreSQL

На Linux нужны bash, flock, GNU coreutils и клиент PostgreSQL версии сервера. Выделите каталог для копий одной базы. Пользователю cron нужны права чтения таблиц и записи в каталог. Для подключения задайте PGDATABASE, PGHOST и PGUSER. Пароль при необходимости хранится в ~/.pgpass с правами 0600.

Пример crontab владельца резервных копий для запуска в 02:00 по местному времени сервера (замените пути и имя БД):

```cron
PGDATABASE=habittrack
PGUSER=habit_backup
PGHOST=localhost
BACKUP_DIR=/var/backups/habittrack
0 2 * * * /bin/bash /opt/habittrack/scripts/backup.sh
```

Скрипт создаёт временный архив, проверяет его оглавление и публикует файл только после успеха. В каталоге остаются семь последних архивов. Проверка оглавления не заменяет пробное восстановление.

## Пробное восстановление

Выберите архив из BACKUP_DIR. На тестовом сервере под пользователем с правом создания базы выполните команды ниже. Используйте новое имя базы и убедитесь, что созданы таблицы users, habits и checkins и совпадают контрольные количества строк.

```bash
archive=/var/backups/habittrack/ИМЯ_АРХИВА.dump
createdb habittrack_restore_test && \
  pg_restore --exit-on-error --single-transaction --no-owner --no-privileges --dbname=habittrack_restore_test "$archive"
psql -d habittrack_restore_test -c '\dt'
```
