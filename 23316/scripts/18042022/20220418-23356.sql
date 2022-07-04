--liquibase formatted sql
--changeset ivanovda:20220418-23356 stripComments:false

update prohibited_correspond_err
set pce_error_msg = 'Снятие наличных денег в валюте выбранного счета запрещено'
where prohibited_correspond_err_code in ('19');

update feature
set feature_enable_script = 
'BEGIN
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3102030'',null,null,''%'',''%'',''1'',null,(select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3102030'') + 1,null,''18'');
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3102030'',null,null,''%'',''%'',null,null,(select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3102030'') + 1,'':DT_CURRENCY_NUM_CODE is not null and :DT_CURRENCY_NUM_CODE not in (:CURR_LIST_FROM_ACC_IN_RESTRICTION_PERIOD)'',''19'');
END;'
where feature_code = 'RESTRICTION_OF_CENTRAL_BANK_3102030';