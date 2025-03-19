-- Usuários por região 

SELECT 
    ut.uf, 
    COUNT(DISTINCT u.user_id) AS total_users
FROM 
    FATAL_MODEL_DB.PUBLIC.FM_USERS AS u
LEFT JOIN 
    FATAL_MODEL_DB.PUBLIC.FM_USER_TRANSACTIONS AS ut
ON 
    u.user_id = ut.user_id
WHERE u.STATUS_DESCRIPTION = 'Ativo'
GROUP BY 
    ut.uf
ORDER BY 
    total_users DESC;

-- Utilizei um arquivo JSON disponível na GeoData contendo as coordenadas geográficas dos estados do Brasil
-- (Fonte: https://raw.githubusercontent.com/giuliano-macedo/geodata-br-states/refs/heads/main/geojson/br_states.json).
# O objetivo desse processo é mapear os usuários por região, associando seus dados (Estado) com as coordenadas geográficas para permitir a análise espacial dos usuários no Brasil.
