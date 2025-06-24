				SELECT  host_user_id,
							COUNT(DISTINCT 
								CONCAT( IFNULL(TRIM(country),''), '|', 
										capacity, '|',
										IFNULL(TRIM(region),''), '|', 
										IFNULL(TRIM(department),''), '|', 
										IFNULL(TRIM(city),''))) AS nb_flats_shared

				FROM le-wagon-home-exchange.home_exchange.clean_exchanges
				GROUP BY host_user_id

#############################################################################################
#																							#
#			This view counts the number of flats shared by each individual hosts 			#
#			(called host_user_id in exchanges and user id in subscription table)			#
#																							#
#############################################################################################
