-- Merged all KPIs from the kpi_guest_exchanges and kpi_host_exchanges tables

with all_exchanges AS (SELECT  
*
FROM `le-wagon-home-exchange.WIP_Sofie.kpi_guest_exchanges` 
UNION ALL 
SELECT
*
FROM le-wagon-home-exchange.WIP_Victor.kpi_host_exchanges
)

SELECT
    guest_user_id AS user_id
    ,SUM(times_as_guest) AS total_exchanges
    ,SUM(finalized_exchanges) AS finalized_exchanges
    ,SUM(canceled_exchanges) AS canceled_exchanges
    ,SUM(succesful_exchanges) AS succesful_exchanges
    ,MIN(first_initiated_exchange) AS first_initiated_exchange
    ,MAX(last_initiated_exchange) AS last_initiated_exchange
    ,MIN(first_finalized_exchange) AS first_finalized_exchange
    ,MAX(last_interaction) AS last_interaction
    ,DATETIME_DIFF(MAX(last_interaction), MIN(first_initiated_exchange), day) AS first_to_last_interaction # max last interaction - min first interaction
    ,SUM(total_night_count_guest) AS total_night_count
FROM all_exchanges
GROUP BY user_id