-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
DROP DATABASE IF EXISTS home_work_2;

CREATE DATABASE home_work_2;

USE home_work_2;

CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT
);

INSERT sales(order_date, count_product)
VALUES
("2022-01-01", "156"),
("2022-01-02", "301"),
("2022-01-03", "21");

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT 
      id AS "Номер заказа",
      order_date AS "Дата формирования заказа",
      count_product AS "Количество",
      IF (count_product<100, "Маленький заказ",
          IF (count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ"))
      AS "Тип заказа"
FROM sales; 

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE orders
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(4),
amount FLOAT(6,2),
order_status VARCHAR(45)
);

INSERT orders(employee_id, amount, order_status)
VALUES
("e03", "15.00", "OPEN"),
("e01", "25.50", "OPEN"),
("e05", "100.70", "CLOSED"),
("e02", "22.18", "OPEN"),
("e04", "9.50", "CANCELLED");

SELECT id, employee_id, amount, order_status, 
CASE
    WHEN order_status = "OPEN" THEN "Order is in open state"
    WHEN order_status = "CLOSED" THEN "Order is closed"
    WHEN order_status = "CANCELLED" THEN "Order is cancelled"
    ELSE "DATABASE ERROR"
END AS full_order_status
FROM orders;