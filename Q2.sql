SELECT *
FROM Quest Q
WHERE Q.succeeded >= '20:00:00' OR Q.succeeded IS NULL
ORDER BY Q.theme, Q.day, q.realm; 
 
