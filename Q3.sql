-- Decimal or dec/ numeric/ precision 
SELECT v.login, v.realm, COUNT(*) AS #visit, DEC(
        ROUND(
                ((CAST( DAYS( MAX(day))- DAYS( MIN(day)) AS DEC))/CAST( (COUNT(*) - 1) AS DEC)),2
             ),5,2
        ) AS FREQUENCY


FROM Visit V
GROUP BY v.login, v.realm
HAVING COUNT(*) > 1
ORDER BY v.login, v.realm;
