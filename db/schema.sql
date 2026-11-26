-- HabitTrack: схема БД (PostgreSQL)

CREATE TABLE users (
    id          BIGSERIAL PRIMARY KEY,
    telegram_id BIGINT    NOT NULL UNIQUE,
    first_name  TEXT,
    timezone    TEXT      NOT NULL DEFAULT 'UTC',
    is_admin    BOOLEAN   NOT NULL DEFAULT FALSE,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE habits (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT    NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title       TEXT      NOT NULL,
    remind_time TIME      NOT NULL,
    is_active   BOOLEAN   NOT NULL DEFAULT TRUE,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE checkins (
    id         BIGSERIAL PRIMARY KEY,
    habit_id   BIGINT    NOT NULL REFERENCES habits(id) ON DELETE CASCADE,
    check_date DATE      NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (habit_id, check_date)
);

CREATE INDEX idx_habits_user ON habits(user_id);
CREATE INDEX idx_checkins_habit_date ON checkins(habit_id, check_date);