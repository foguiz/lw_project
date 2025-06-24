/*Cleaning steps for removing abnormal data from the exchanges table - abnormal dates from requests,
invalid requests (null start data, null end data, 0 on nights, 0 on guests, also removed all RECIPROCAL exchanges
that contains duplicates lines (only 39 rows) to facilitate the data handling*/

WITH count_conversation_id AS (
  SELECT
  *
  ,COUNT(conversation_id) OVER (PARTITION BY conversation_id) nb_conversation_id
FROM `le-wagon-home-exchange.WIP_Victor.exchanges_copy`),
--Clear out typos from created_at, start_on dates and null values for start_on date
clean_dates AS (
SELECT
  *
FROM count_conversation_id
WHERE start_on > created_at AND start_on < "2027-01-01"
ORDER BY conversation_id DESC
)
--remove all RECIPROCAL exchange_type that did not contain a mirrored request - means that part of the deal is incomplete
SELECT
*
FROM clean_dates
WHERE (exchange_type = 'RECIPROCAL' AND nb_conversation_id = 2) OR exchange_type = 'NON_RECIPROCAL'
ORDER BY conversation_id;
--10576121
