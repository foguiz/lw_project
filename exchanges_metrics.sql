SELECT
    creator_id
    ,COUNT(exchange_id) AS total_initiated_exchanges
    ,COUNT(finalized_at) AS finalized_exchanges
    ,SUM(CASE WHEN creator_id = guest_user_id THEN 1 ELSE 0 END) AS guest_count
    ,SUM(CASE WHEN creator_id = host_user_id THEN 1 ELSE 0 END) AS host_count
    ,MIN(created_at) AS first_initiated_exchange
    ,MAX(created_at) AS last_initiatied_exchange
    ,MIN(CASE WHEN finalized_at IS NULL THEN NULL ELSE created_at END) AS first_finalized_exchange
    ,MAX(CASE WHEN finalized_at IS NULL THEN NULL ELSE created_at END) AS last_finalized_exchange
    ,AVG(night_count) AS avg_night_count
    ,COUNT(night_count) AS total_night_count
FROM le-wagon-home-exchange.home_exchange.clean_exchanges
GROUP BY creator_id, night_count;



--code to create metrics for exchanges