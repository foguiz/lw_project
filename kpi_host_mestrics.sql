/*Key metrics from a host perspective to be joined with the guest perspective calculate KPIs so we can UNION ALL in one QUERY
the main information to calculate KPIs related to: Onboard new users using high-value customer data and Recommend behavior based on successful high-value patterns*/

SELECT
  host_user_id
  ,COUNT(host_user_id) AS times_as_host
  ,COUNT(finalized_at) AS finalized_exchanges
  ,COUNT(canceled_at) AS canceled_exchanges
  ,(COUNT(finalized_at) - COUNT(canceled_at)) AS succesful_exchanges
  ,MIN(created_at) AS first_initiated_exchange
  ,MAX(created_at) AS last_initiatied_exchange
  ,MIN(finalized_at) AS first_finalized_exchange --get the first date when finalized, if NULL means never finalized an exchange
  ,MAX(CASE WHEN canceled_at IS NULL THEN finalized_at ELSE canceled_at END) AS last_interaction --get the last finalized date, it can be canceled_at - as cancelation can happen afterwards
  ,SUM(CASE WHEN finalized_at IS NOT NULL AND canceled_at IS NULL THEN night_count ELSE 0 END) AS total_night_count_host
FROM le-wagon-home-exchange.home_exchange.clean_exchanges
GROUP BY host_user_id;