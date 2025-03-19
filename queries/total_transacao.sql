-- Total transacionado
SELECT
    SUM(ut.paid_value) AS total_paid_value
FROM FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
LEFT JOIN FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
    ON u.user_id = ut.user_id
WHERE u.status_description  = 'Ativo'