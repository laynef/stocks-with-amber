-- +micrate Up
CREATE TABLE stocks (
  id BIGSERIAL PRIMARY KEY,
  symbol VARCHAR,
  company_name VARCHAR,
  price FLOAT,
  user_id BIGINT,
  amount FLOAT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX stock_user_id_idx ON stocks (user_id);

-- +micrate Down
DROP TABLE IF EXISTS stocks;
