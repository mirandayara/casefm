-- Usuários x Transações 

SELECT 
    COUNT(DISTINCT CASE WHEN total_paid_value > 0 THEN user_id END) AS users_transacting,  -- Usuários ativos que transacionaram (paid_value > 0)
    COUNT(DISTINCT CASE WHEN total_paid_value = 0 OR total_paid_value IS NULL THEN user_id END) AS users_not_transacting  -- Usuários ativos que não transacionaram (paid_value = 0)
FROM (
    SELECT 
        u.user_id,
        SUM(ut.paid_value) AS total_paid_value
    FROM 
        FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
    LEFT JOIN 
        FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
        ON u.user_id = ut.user_id
    WHERE 
        u.status_description = 'Ativo'
    GROUP BY 
        u.user_id
) AS user_transaction_summary;
