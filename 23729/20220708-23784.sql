--liquibase formatted sql
--changeset ivanovda:20220708-23784 stripComments:false

update SYSTEM_FUNCTION
set
SF_PARAMETERS = 'accessedIsoCodes=USD,EUR,CAD,NOK,CHF,SEK,PLN,DKK'
where SYSTEM_FUNCTION_ID in ('3013515','3013516');