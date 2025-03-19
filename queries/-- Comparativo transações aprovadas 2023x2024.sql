-- Comparativo transações aprovadas 2023x2024

SELECT 
    CASE 
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 1 THEN 'Jan'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 2 THEN 'Fev'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 3 THEN 'Mar'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 4 THEN 'Abr'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 5 THEN 'Mai'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 6 THEN 'Jun'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 7 THEN 'Jul'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 8 THEN 'Ago'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 9 THEN 'Set'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 10 THEN 'Out'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 11 THEN 'Nov'
        WHEN EXTRACT(MONTH FROM ut.approved_at) = 12 THEN 'Dez'
    END AS month,  
    SUM(CASE WHEN EXTRACT(YEAR FROM ut.approved_at) = 2023 THEN ut.paid_value ELSE 0 END) AS total_paid_value_2023,
    SUM(CASE WHEN EXTRACT(YEAR FROM ut.approved_at) = 2024 THEN ut.paid_value ELSE 0 END) AS total_paid_value_2024
FROM 
    FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
LEFT JOIN 
    FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
    ON u.USER_ID = ut.USER_ID
WHERE 
    EXTRACT(YEAR FROM ut.approved_at) IN (2023, 2024)
GROUP BY 
    EXTRACT(MONTH FROM ut.approved_at)           
ORDER BY 
    EXTRACT(MONTH FROM ut.approved_at);
