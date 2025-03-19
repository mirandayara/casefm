-- Comparativo anual planos 2023x2024

SELECT 
    ut.plan,
    SUM(CASE WHEN EXTRACT(YEAR FROM ut.approved_at) = 2023 THEN ut.PAID_VALUE ELSE 0 END) AS total_paid_value_2023,
    SUM(CASE WHEN EXTRACT(YEAR FROM ut.approved_at) = 2024 THEN ut.PAID_VALUE ELSE 0 END) AS total_paid_value_2024
FROM 
    FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
LEFT JOIN 
    FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
    ON u.user_id = ut.user_id
WHERE 
     ut.plan IS NOT NULL
    AND EXTRACT(YEAR FROM ut.approved_at) IN (2023, 2024)  -- Filtro para trazer apenas os anos desejados
GROUP BY 
    ut.plan
ORDER BY 
    (total_paid_value_2024 + total_paid_value_2023) DESC  -- Ordena pelo total acumulado nos dois anos
LIMIT 9;