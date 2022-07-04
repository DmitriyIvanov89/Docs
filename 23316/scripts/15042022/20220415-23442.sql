--liquibase formatted sql
--changeset ivanovda:20220415-23442 stripComments:false

update system_function
set sf_parameters = 'featureGroupCode=LIMITATION;title=Ограничения на валютные наличные операции;modeView=comby;namesOfButtons=Отключена,Включена'
where system_function_id = '2809300';