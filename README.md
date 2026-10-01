# HabitTrack Bot — трекер привычек в Telegram

Telegram-бот «HabitTrack» — трекер привычек с напоминаниями, статистикой и streaks.

## Цель

Помочь людям формировать привычки: бот присылает ежедневные напоминания, принимает отметки выполнения и показывает визуальный прогресс. Пользователь не забывает о цели и видит результат прямо в Telegram, без установки отдельного приложения.

## Ключевые функции

- Регистрация пользователя и добавление привычек
- Ежедневные напоминания
- Отметки выполнения
- Streaks — серии выполнения подряд
- Статистика и прогресс

## Технологии

Python, aiogram

## Документация

Wiki проекта: <https://github.com/GodLawen/project/wiki>

## Структура репозитория

- `docs/` — документация проекта
- `data/` — шаблоны сообщений и справочники
- `src/habittrack/` — код бота (`handlers/` — обработчики команд)
- `tests/` — тесты
- `.env.example` — пример настроек; реальный `.env` с токеном в Git не попадает

## Как запустить
«Статус: MVP в разработке»
1. Создайте бота у @BotFather и получите токен.
2. Скопируйте `.env.example` в `.env` и вставьте токен.
3. Установите зависимости: `pip install aiogram`.
4. Запустите бота: `python -m src.habittrack`.

## Навигация

- [Wiki](https://github.com/GodLawen/project/wiki)
- [Концепция](https://github.com/GodLawen/project/wiki/Concept)
- [Идеи](https://github.com/GodLawen/project/wiki/Ideas)
- [Заинтересованные стороны](https://github.com/GodLawen/project/wiki/Stakeholders)
- [Документация в репозитории](docs/index.md)
