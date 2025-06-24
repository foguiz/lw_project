SELECT  host_user_id
            ,EXTRACT(year FROM finalized_at) AS finalized_year
            ,COUNT(DISTINCT CONCAT( IFNULL(TRIM(country),''), '|', 
                            capacity, '|',
                            IFNULL(TRIM(region),''), '|', 
                            IFNULL(TRIM(department),''), '|', 
                            IFNULL(TRIM(city),''))) AS nb_flats

            ,COUNT(DISTINCT exchange_id) AS nb_exchanges
            ,SUM(night_count) AS sum_nights

FROM `le-wagon-home-exchange`.WIP_Tamas.exchanges
WHERE finalized_at IS NOT NULL and canceled_at IS NULL

GROUP BY host_user_id
         ,EXTRACT(year FROM finalized_at)


                  