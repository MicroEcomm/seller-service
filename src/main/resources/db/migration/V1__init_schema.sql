-- seller_db schema

CREATE TYPE seller_status AS ENUM ('PENDING', 'ACTIVE', 'SUSPENDED', 'REJECTED');

CREATE TABLE sellers (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,
    business_name VARCHAR(255) NOT NULL,
    gst_number VARCHAR(20),
    pan_number VARCHAR(15),
    status seller_status NOT NULL DEFAULT 'PENDING',
    bank_account_number VARCHAR(50),
    bank_ifsc_code VARCHAR(20),
    bank_name VARCHAR(100),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE seller_documents (
    id BIGSERIAL PRIMARY KEY,
    seller_id BIGINT NOT NULL REFERENCES sellers(id),
    document_type VARCHAR(50) NOT NULL,
    document_url TEXT NOT NULL,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_sellers_user_id ON sellers(user_id);
