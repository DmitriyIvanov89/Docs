--liquibase formatted sql
--changeset ivanovda:20220707-23766 stripComments:false

update system_function 
set sf_parameters = 'accessedIsoCodes=USD,EUR,CAD,NOK,GBP,CHF,SEK,PLN,DKK'
where system_function_id in ('3013551');

update system_function 
set sf_parameters = 'accessedIsoCodes=USD,EUR,CAD,NOK,CHF,SEK,JPY,PLN,CNY,DKK'
where system_function_id in ('3013552');