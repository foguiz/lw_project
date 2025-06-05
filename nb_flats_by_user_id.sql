SELECT  host_user_id,
            COUNT(DISTINCT  CONCAT( IFNULL(TRIM(country),''), '|', 
                            capacity, '|',
                            IFNULL(TRIM(region),''), '|', 
                            IFNULL(TRIM(department),''), '|', 
                            IFNULL(TRIM(city),''))) AS nb_flats_shared

FROM `le-wagon-home-exchange`.WIP_Tamas.exchanges
GROUP BY host_user_id