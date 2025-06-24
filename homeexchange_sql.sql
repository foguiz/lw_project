--- ........................................................................................
-- ///1. DATA CLEANING ///
-- .........................................................................................
-- EXCHANGES TABLE
--Primary Key test in exchange_id (exchanges table)
SELECT
  exchange_id
  ,COUNT(*) nb
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`
GROUP BY exchange_id
HAVING nb > 1

/*Results were empty - confirming that there are no duplicated values
in the column exchange_id*/

--Null test - empty results
SELECT
  exchange_id
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`
WHERE exchange_id IS NULL
/*Results were empty - confirming that there are no NULL values
in the column exchange_id */

-- .........................................................................................
-- SUBSCRIPTIONS TABLE