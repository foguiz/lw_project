-- Created metrics on guest user level


SELECT
    guest_user_id
    ,COUNT(guest_user_id) AS times_as_guest
    ,COUNT(finalized_at) AS finalized_exchanges
    ,COUNT(canceled_at) AS canceled_exchanges
    ,COUNT (finalized_at)-COUNT(canceled_at) AS succesful_exchanges
    ,MIN(created_at) AS first_initiated_exchange
    ,MAX(created_at) AS last_initiated_exchange
    ,MIN(finalized_at) AS first_finalized_exchange
    ,MAX(CASE WHEN canceled_at IS NULL THEN finalized_at ELSE canceled_at END) AS last_interaction
    ,SUM(CASE WHEN finalized_at IS NOT NULL AND canceled_at IS NULL THEN night_count ELSE 0 END) AS total_night_count_guest
FROM le-wagon-home-exchange.home_exchange.clean_exchanges
GROUP BY guest_user_id;