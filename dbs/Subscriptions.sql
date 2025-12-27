CREATE TABLE plans (
    id            UUID PRIMARY KEY,
    name          VARCHAR(50) NOT NULL UNIQUE,
    duration_days INTEGER DEFAULT 30,
    quotas        JSONB NOT NULL DEFAULT '{}',
    created_at    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE subscriptions (
    id         UUID PRIMARY KEY,
    user_id    UUID NOT NULL,
    plan_id    UUID NOT NULL REFERENCES plans(id),
    start_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    end_date   TIMESTAMP WITH TIME ZONE NOT NULL,
    is_active  BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_quotas (
    id              UUID PRIMARY KEY,
    user_id         UUID NOT NULL,
    resource        VARCHAR(50) NOT NULL,
    "limit"           INTEGER, 
    used            INTEGER DEFAULT 0,
    subscription_id UUID REFERENCES subscriptions(id),
    
    UNIQUE(user_id, resource, subscription_id)
);

CREATE INDEX idx_subscriptions_user ON subscriptions(user_id);
CREATE INDEX idx_quotas_user_resource ON user_quotas(user_id, resource);
