SELECT *
FROM Player P
WHERE LCASE(P.login) = LCASE(SUBSTR(P.name, 1, LENGTH(p.login)))
ORDER BY P.login ASC;
