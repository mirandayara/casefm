-- Transações por pagamento
SELECT 
    ut.payment_method, 
    SUM(ut.paid_value) AS total_paid_value
FROM 
    FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
GROUP BY 
    ut.payment_method
ORDER BY 
    total_paid_value DESC;
