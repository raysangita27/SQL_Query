SELECT  Doctor, Professor, Singer , Actor 
FROM (
SELECT ROW_NUMBER()OVER (PARTITION BY Occupation ORDER BY Name) rn,
    NAME , OCCUPATION FROM OCCUPATIONS 
) AS TABLE1
PIVOT
(
    MAX(NAME) FOR OCCUPATION IN (Doctor, Professor, Singer , Actor)) AS TABLE2 
    ORDER BY rn;
