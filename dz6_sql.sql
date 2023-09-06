-- Задача 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE DATABASE IF NOT EXISTS lesson_6_dz;
USE lesson_6_dz;

DROP FUNCTION IF EXISTS format_seconds;
CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(50)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(50);

    SET days = seconds DIV (24 * 3600);
    SET seconds = seconds MOD (24 * 3600);
    SET hours = seconds DIV 3600;
    SET seconds = seconds MOD 3600;
    SET minutes = seconds DIV 60;
    SET seconds = seconds MOD 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END;

SHOW CREATE FUNCTION format_seconds;

SELECT format_seconds(123456);


-- Задача 2
-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10
SELECT number FROM (
  SELECT 1 AS number UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL
  SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
  SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
) numbers
WHERE number % 2 = 0;
