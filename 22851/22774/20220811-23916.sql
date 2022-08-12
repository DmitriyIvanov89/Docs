--liquibase formatted sql
--changeset ivanovda:20220811-23916 stripComments:false

update "PARAMETER"
set
p_value = 'null'
where parameter_codification_code in ('VTB24_ASK_SIGN_ID_SYS_TYPES');