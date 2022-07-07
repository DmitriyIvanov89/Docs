--liquibase formatted sql
--changeset ivanovda:20220707-23773 stripComments:false

update system_function 
set sf_parameters = 'operType=det;valuableSortId=-400;accessedIsoCodes=USD,EUR,CAD,NOK,GBP,CHF,SEK,JPY,PLN,CNY,DKK'
where system_function_id in ('3013541','3014015');

update system_function 
set sf_parameters = 'operTypeYL=detyl;valuableSortId=-400;accessedIsoCodes=USD,EUR,CAD,NOK,GBP,CHF,SEK,JPY,PLN,CNY,DKK'
where system_function_id in ('3013542','3014016');