CREATE TABLE questions (
    id         UUID PRIMARY KEY,
    content    TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE answers (
    id          UUID PRIMARY KEY,
    user_id     UUID NOT NULL,
    question_id UUID NOT NULL REFERENCES questions(id),
    content     TEXT NOT NULL,
    status      VARCHAR(100) NOT NULL DEFAULT 'UPLOADED',
    analysis    TEXT,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_answers_user_id ON answers(user_id);
CREATE INDEX idx_answers_user_question ON answers(user_id, question_id);
