--liquibase formatted sql
--changeset ivanovda:20220629-23728 stripComments:false

update SYSTEM_FUNCTION
set
SF_PARAMETERS = 'operType=buy;accessedIsoCodes=USD,EUR,CHF,CNY,JPY,CAD,NOK,SEK,PLN,DKK'
where SYSTEM_FUNCTION_ID = '3013510';