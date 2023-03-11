-- Part2
-- 2.

-- Создайте таблицу "Orders", которая будет содержать информацию о заказах:
-- идентификатор, идентификатор пользователя, дата заказа, статус заказа (новый,
-- обработанный, отмененный

USE part2;

CREATE TABLE IF NOT EXISTS Orders(
ID INT PRIMARY KEY AUTO_INCREMENT,
IDusers INT,
DATAREGISTRATION DATE,
STATUSPURCHASE VARCHAR(30),
FOREIGN KEY (IDusers)  REFERENCES users (ID)
); 

SELECT * FROM Orders;

INSERT INTO Orders(IDusers,DATAREGISTRATION,STATUSPURCHASE) VALUES(1,now(),"новый");

