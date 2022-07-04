--liquibase formatted sql
--changeset ivanovda:20220628-23728 stripComments:false

update SYSTEM_FUNCTION
set
SF_PARAMETERS = 'operType=buy;accessedIsoCodes=USD,EUR,CHF,CNY,JPY,CAD,NOK,SEK,PLN'
where SYSTEM_FUNCTION_ID = '3013510';