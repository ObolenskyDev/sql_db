-- =============================================
-- Retail Sales Analytics
-- Stack: PostgreSQL
-- Description: Sales reporting, revenue calculation, and inventory analysis
-- =============================================

-- 1. Product Filtering
-- Задача: Найти все товары бренда Apple дешевле $500.
SELECT * FROM products 
WHERE brand = 'Apple' AND price < 500;

-- 2. Category Statistics
-- Задача: Посчитать количество ассортимента в каждой категории.
SELECT category, COUNT(*) as items_count
FROM products 
GROUP BY category;

-- 3. Total Revenue by Product (JOIN + Aggregation)
-- Задача: Рассчитать общую выручку (Total Revenue) по каждому товару.
SELECT 
    p.name, 
    SUM(p.price * s.quantity) as total_revenue
FROM products p
JOIN sales s ON p.id = s.product_id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- 4. High-Value Products Analysis (HAVING)
-- Задача: Показать только товары с выручкой более $2000 ("Best Sellers").
SELECT 
    p.name, 
    SUM(p.price * s.quantity) as total_revenue
FROM products p
JOIN sales s ON p.id = s.product_id
GROUP BY p.name
HAVING SUM(p.price * s.quantity) > 2000
ORDER BY total_revenue DESC;