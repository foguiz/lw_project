SELECT
  a.guest_user_id,
	CASE WHEN b.total_paid_subscriptions >1 THEN 'Y' ELSE 'N' END AS High_value_customer,
  a.host_user_id,
	a.exchange_id,
  a.created_at,
  date(a.finalized_at) as finalized_at,
  date(a.canceled_at) as canceled_at,
  CASE WHEN a.finalized_at is not null and a.canceled_at is null THEN 'Closed'
  	   WHEN a.finalized_at is not null and a.canceled_at is not null THEN 'Canceled'
  	   ELSE 'Open' END as exchange_status,
  a.start_on,
  a.end_on,
  c.continent_name as host_continent_name,  
  a.country AS host_country_code,
  c.country_name as host_country_name,
  a.city AS host_city,
  cc.continent_name  as guest_continent_name,
  b.country AS guest_country_code,
  cc.country_name as guest_country_name,
  b.city AS guest_city,
  CASE 
	  WHEN a.country = b.country THEN 1 
	  WHEN (a.country is null or b.country is null) THEN null
	  else 0 END as domestic_travel,
  CASE 
	  WHEN c.continent_code <> cc.continent_code THEN 1 
	  WHEN (a.country is null or b.country is null) THEN null
	  else 0 END as intercontinental_travel,

CASE 
	  WHEN (a.country <> b.country and c.continent_code = cc.continent_code) THEN 1 
	  WHEN (a.country is null or b.country is null) THEN null
	  else 0 END as international,

CASE 
	  WHEN a.country = b.country THEN 'Domestic'
		WHEN c.continent_code <> cc.continent_code THEN 'Intercontinental'
		WHEN (a.country <> b.country and c.continent_code = cc.continent_code) THEN 'International'
		ELSE 'Unknown' END as type

	,a.guest_countguest_count as guest_count
	,a.night_count
	,a.exchange_type
	,a.home_type
	,a.residence_type
	,a.capacity
	
FROM `le-wagon-home-exchange.WIP_Tra.exchanges_joined_guest_id` AS a
LEFT JOIN le-wagon-home-exchange.home_exchange.clean_subscriptions AS b
  	ON a.guest_user_id = b.user_id
LEFT JOIN `le-wagon-home-exchange`.home_exchange.country_codes c 
	ON c.country_code=a.country
LEFT JOIN `le-wagon-home-exchange`.home_exchange.country_codes cc 
	ON cc.country_code=b.country
	
WHERE a.finalized_at IS NOT NULL
