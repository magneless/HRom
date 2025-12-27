CREATE TABLE cvs (
    id         UUID PRIMARY KEY,
    user_id    UUID NOT NULL,
    filename   VARCHAR(255) NOT NULL,
    s3_key     TEXT NOT NULL,
    status     VARCHAR(50) NOT NULL DEFAULT 'UPLOADED',
    analysis   JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_cvs_user_id ON cvs(user_id);