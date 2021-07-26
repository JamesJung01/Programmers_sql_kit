SET @ROW_NUM = -1;

SELECT HOUR, MAX(COUNT) AS COUNT
FROM (
    (SELECT HOUR(DATETIME) AS HOUR, COUNT(*) AS COUNT
     FROM ANIMAL_OUTS
     GROUP BY HOUR)
     UNION
    (SELECT @ROW_NUM := @ROW_NUM + 1 AS HOUR, 0 AS COUNT
     FROM ANIMAL_OUTS
     LIMIT 24)
    ) AS RESULT_SET
GROUP BY HOUR
ORDER BY HOUR;