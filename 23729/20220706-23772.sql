--liquibase formatted sql
--changeset ivanovda:20220706-23773 stripComments:false

update system_function 
set sf_parameters = 'operType=exm;valuableSortId=-400;accessedIsoCodes=USD,EUR,CAD,NOK,GBP,CHF,SEK,JPY,PLN,CNY,DKK'
where system_function_id in ('3013536','3014005');

update system_function 
set sf_parameters = 'operTypeYL=exmyl;valuableSortId=-400;accessedIsoCodes=USD,EUR,CAD,NOK,GBP,CHF,SEK,JPY,PLN,CNY,DKK'
where system_function_id in ('3013537','3014010');