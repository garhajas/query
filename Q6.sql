
SELECT Q1.theme AS THEME
FROM Quest Q1 
--ORDER BY Q1.theme

EXCEPT 

SELECT theme
FROM Quest
WHERE succeeded IS NULL
--ORDER BY Q1.theme
 
; 
