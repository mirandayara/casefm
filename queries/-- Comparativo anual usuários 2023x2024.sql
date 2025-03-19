-- Comparativo anual usuários 2023x2024
SELECT 
    EXTRACT(YEAR FROM u.creation_date) AS year,
    COUNT(DISTINCT u.user_id) AS total_users
FROM 
    FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
WHERE 
    EXTRACT(YEAR FROM u.creation_date) IN (2023, 2024)
GROUP BY 
    EXTRACT(YEAR FROM u.creation_date)
ORDER BY 
    year;
