-- Created final User/Customer KPIs by joining Exchanges with Subscriptions table


SELECT 
  su.user_id
  ,su.first_filed_subscription_date
  ,su.last_subscription_date
  ,su.total_paid_subscriptions
  ,ex.total_exchanges
  ,ex.finalized_exchanges
  ,ex.canceled_exchanges
  ,ex.succesful_exchanges
  ,ex.first_initiated_exchange
  ,ex.last_initiated_exchange
  ,ex.first_finalized_exchange
  ,ex.last_interaction
  ,ex.first_to_last_interaction
  ,ex.total_night_count
FROM le-wagon-home-exchange.home_exchange.clean_subscriptions su
INNER JOIN le-wagon-home-exchange.WIP_Sofie.kpi_all_exchanges ex
ON su.user_id = ex.user_id;