-- =============================================
-- Database Schema & Seed Data
-- System: PostgreSQL
-- =============================================

-- 1. Create Tables
-- Сбрасываем sales первым, так как он зависит от products
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  brand VARCHAR(30),   -- Добавил эту колонку!
  category VARCHAR(20),
  price INT
);

CREATE TABLE sales (
  id INT PRIMARY KEY,
  product_id INT,
  quantity INT,
  sale_date DATE DEFAULT CURRENT_DATE
);

-- 2. Populate Data (Seeding)
-- Теперь указываем бренд внутри скобок
INSERT INTO products VALUES 
(1, 'iPhone 15', 'Apple', 'Phone', 1000),
(2, 'Samsung S24', 'Samsung', 'Phone', 900),
(3, 'MacBook Air', 'Apple', 'Laptop', 1200),
(4, 'iPad', 'Apple', 'Tablet', 450), -- Изменил цену на 450, чтобы он попал в фильтр "< 500"
(5, 'Xiaomi 14', 'Xiaomi', 'Phone', 300);

INSERT INTO sales VALUES 
(1, 1, 2, '2024-01-10'), -- 2 Айфона
(2, 3, 1, '2024-01-12'), -- 1 Макбук
(3, 1, 1, '2024-01-15'), -- Еще 1 Айфон
(4, 5, 5, '2024-01-20'); -- 5 Сяоми