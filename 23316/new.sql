--liquibase formatted sql
--changeset ivanovda:20220320-23357 stripComments:false

insert /*+ ignore_row_on_dupkey_index(FEATURE,PK_FEATURE) */ into FEATURE (FEATURE_CODE,FEATURE_GROUP_CODE,FEATURE_NAME,FEATURE_ENABLE_FLAG,FEATURE_DISABLE_SCRIPT,FEATURE_ENABLE_SCRIPT,FEATURE_SN)
values ('RESTRICTION_OF_CENTRAL_BANK_3102040', 'LIMITATION', 'Выдача наличных средств с МС/ТС клиента с комиссией. Ограничения: Руб-Руб; Доллары-{Руб,Доллары}','0',
'BEGIN 
DELETE PROHIBITED_CORRESPOND WHERE SYSTEM_FUNCTION_ID = ''3102040'' and DR_ID_SYS_TYPE_CODE is null and CR_ID_SYS_TYPE_CODE is null and PC_EXT_TYPE_ACC_DR = ''%'' and PC_EXT_TYPE_ACC_CR = ''%'' and PC_CONVERSION_FLAG is null and PC_COND_EXPR like ''%CURRENCY_NUM_CODE%'';  
END;',
'BEGIN 
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3102040'',null,null,''%'',''%'',''1'',null,(select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3102040'') + 1,null,''6''); 
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3102040'',null,null,''%'',''%'',null,null,(select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3102040'') + 1,'':DT_CURRENCY_NUM_CODE is not null and :DT_CURRENCY_NUM_CODE not in (''''810'''', ''''840'''')'',''18''); 
END;',
null);





