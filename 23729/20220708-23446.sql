--liquibase formatted sql
--changeset ivanovda:20220708-23446 stripComments:false


update SYSTEM_FUNCTION
set
SF_PARAMETERS = 'operType=sale;accessedIsoCodes=USD,EUR,CAD,NOK,GBP,CHF,SEK,PLN,DKK'
where SYSTEM_FUNCTION_ID in ('3013505','3013506');