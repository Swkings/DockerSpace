-- Active: 1750525561176@@127.0.0.1@5432@mydb
-- 初始化用户和数据库示例
CREATE USER test WITH PASSWORD 'test';
CREATE DATABASE testdb OWNER test;
GRANT ALL PRIVILEGES ON DATABASE testdb TO test;

-- 在mydb数据库中插入测试表和数据（root账户自动拥有mydb权限）
\c mydb

-- 用户表
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100)
);
INSERT INTO users (name, email) VALUES
  ('Alice', 'alice@example.com'),
  ('Bob', 'bob@example.com');

-- 商品表
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price NUMERIC(10,2)
);
INSERT INTO products (name, price) VALUES
  ('Apple', 3.50),
  ('Banana', 2.00),
  ('Orange', 4.00);

-- 订单表
CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  product_id INTEGER REFERENCES products(id),
  quantity INTEGER,
  order_date DATE
);
INSERT INTO orders (user_id, product_id, quantity, order_date) VALUES
  (1, 1, 2, '2024-06-01'),
  (1, 2, 1, '2024-06-02'),
  (2, 3, 5, '2024-06-03');

-- 学生表
CREATE TABLE IF NOT EXISTS students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  class VARCHAR(20)
);
INSERT INTO students (name, class) VALUES
  ('Tom', 'Class 1'),
  ('Jerry', 'Class 2'),
  ('Lucy', 'Class 1');

-- 成绩表
CREATE TABLE IF NOT EXISTS scores (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students(id),
  subject VARCHAR(50),
  score INTEGER
);
INSERT INTO scores (student_id, subject, score) VALUES
  (1, 'Math', 90),
  (1, 'English', 85),
  (2, 'Math', 78),
  (3, 'English', 92); 