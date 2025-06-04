WITH  SUB as (SELECT user_id
                ,first_subscription_date as start_subscription_date
                ,min(subscription_date) as first_filed_subscription_date
                ,max(subscription_date) as last_subscription_date
                ,max(referral) as total_referrals
                ,sum(promotion) total_promotions
                ,count(distinct extract (year FROM subscription_date)) as total_renewals
                ,country, region, department, city
              FROM home_exchange.subscriptions
              group by user_id, first_subscription_date,  country, region, department, city)


SELECT user_id, start_subscription_date, first_filed_subscription_date, last_subscription_date,
			 total_referrals, total_promotions, 
					CASE WHEN EXTRACT (year FROM first_filed_subscription_date) = 2021 
					THEN total_renewals-1
					ELSE total_renewals
					END as total_renewals
			 ,country, region, department, city

from SUB

#########################################################################################################
# Customers can have as many lines based on the length of their subscription and the number of renewals #
# In order to prevent duplications when joining with the exchanges table, we need to normalize data,    #
# so that one line represent only one customer.															#
#########################################################################################################
# 																										#
# last_subscription_date - shows the last subscription date												#
# total_referrals - number of referral 0 or 1                                                           #
# total_promotions - shows the sum of promotions fof the customer										#
# total_renewals - shows the number of renewals															#
#																										#
#########################################################################################################