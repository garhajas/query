
SELECT A.login AS LOGIN, P.name AS NAME, P.gender AS GENDER, 
		(SELECT a2.#avatar
		FROM ( SELECT a1.login, p1.name, p1.gender , count (a1.name) as #avatar
				FROM PLayer p1, Avatar a1
				WHERE a1.login = p1.login 
				GROUP BY a1.login, p1.name,p1.gender
				ORDER BY a1.login, p1.name,p1.gender ) AS a2
		WHERE a2.login = A.login)

FROM Player P, Avatar A
WHERE P.login = A.login AND  P.gender != A.gender
GROUP BY A.login, P.name, P.gender 
ORDER BY A.login

;

