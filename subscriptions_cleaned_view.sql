SELECT user_id
			,first_subscription_date as start_subscription_date
			,min(subscription_date) as first_filed_subscription_date
			,max(subscription_date) as last_subscription_date
			,max(referral) as total_referrals
			,sum(promotion) total_promotions
			,count(distinct extract (year FROM subscription_date)) as total_renewals
			,country, region, department, city

FROM home_exchange.subscriptions
group by user_id, first_subscription_date,  country, region, department, city

#########################################################################################################
# Customers can have as many lines based on the length of their subscription and the number of renewals #
# In order to prevent duplications when joining with the exchanges table, we need to normalize data,    #
# so that one line represent only one customer.															#
#########################################################################################################
#																									    #
# last_subscription_date - shows the last subscription date												#
# total_referrals - shows the sum of referral for the customer										    #
# total_promotions - shows the sum of promotions fof the customer										#
# total_renewals - shows the number of renewals															#
#########################################################################################################