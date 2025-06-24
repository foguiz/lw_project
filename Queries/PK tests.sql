/*Please checke the query for the tests if it's working. PK should be  exchanges_id

Primary Key Test on Exchange_ID
Duplicated test - empty results
*/
SELECT
  exchange_id
  ,COUNT(*) nb
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`
GROUP BY exchange_id
HAVING nb > 1
--Null test - empty results
SELECT
  exchange_id
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`
WHERE exchange_id IS NULL
--Unique ID Test Conversation ID - FALSE - values goes from 2 to 3
SELECT
  conversation_id
  ,COUNT(*) nb
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`
GROUP BY conversation_id
HAVING nb > 1
ORDER BY nb DESC
--Check what conversation_id means
SELECT
  *,
  count(conversation_id) OVER (PARTITION BY conversation_id) nb
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`
WHERE conversation_id = 36416224