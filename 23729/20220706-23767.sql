--liquibase formatted sql
--changeset ivanovda:20220706-23767 stripComments:false

update system_function 
set sf_parameters = 'operType=enc;accessedIsoCodes=USD,EUR,CAD,NOK,CHF,JPY,PLN,DKK'
where system_function_id in ('3013531');

update system_function 
set sf_parameters = 'operTypeYL=encyl;accessedIsoCodes=USD,EUR,CAD,NOK,CHF,JPY,PLN,DKK'
where system_function_id in ('3013532');

