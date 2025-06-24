UPDATE `le-wagon-home-exchange`.WIP_Tamas.exchanges AS a
SET
    a.city = b.city_corrected,
    a.region = b.region_corrected
FROM
  (SELECT DISTINCT city, city_corrected, region_corrected
  FROM `le-wagon-home-exchange.WIP_Tamas.location_data_correction` ) as B
    
WHERE
    a.city = b.city