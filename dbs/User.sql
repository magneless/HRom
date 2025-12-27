CREATE TABLE profiles (
    id           UUID PRIMARY KEY,
    email        VARCHAR(255) NOT NULL UNIQUE,
    name         VARCHAR(255),
    phone_number VARCHAR(50),
    company      VARCHAR(255)
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
