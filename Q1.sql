with hello AS (
		SELECT A.login, COUNT(CASE WHEN A.gender = 'M' THEN 1 END) AS mm, 
		COUNT(CASE WHEN A.gender = 'F' THEN 1 END) AS ff
		FROM Avatar A
		GROUP BY A.login
	) 
SELECT DISTINCT P.login AS LOGIN, REPLACE(REPLACE(P.gender, 'F', 'female'), 'M', 'male') AS gender,
-- if statements,
(CASE	 WHEN h.ff > 0 AND h.mm = 0 THEN 'female'
	WHEN h.mm > 0 AND h.ff = 0 THEN 'male'
	WHEN h.mm > 0 AND h.ff > 0 THEN 'both' END) AS avatars
FROM hello h, Player P
WHERE P.login = h.login
ORDER BY P.login;
