-- Quantidade de Usuários Ativos
SELECT COUNT(DISTINCT u.user_id) AS total_distinct_users
FROM FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
LEFT JOIN FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
    ON u.user_id = ut.user_id
WHERE u.status_description = 'Ativo';