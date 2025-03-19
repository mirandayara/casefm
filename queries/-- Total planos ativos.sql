-- Total planos ativos
SELECT SUM(u.active_plans_count) AS soma_planos_ativos
FROM FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
LEFT JOIN FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
    ON u.user_id = ut.user_id
WHERE u.status_description  = 'Ativo';
