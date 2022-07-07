--liquibase formatted sql
--changeset ivanovda:20220706-23768 stripComments:false

update system_function
set
sf_parameters = 'accessedIsoCodes=USD,EUR,CAD,NOK,CHF,SEK,JPY,PLN,CNY,DKK'
where system_function_id in ('3013520');