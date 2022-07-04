--liquibase formatted sql
--changeset ivanovda:20220414-23382 stripComments:false

update feature
set 
feature_name = 'Выдача наличных средств со вклада (с закрытием). Ограничения Банка России',
feature_enable_script = 
'BEGIN 
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3202000'',null,null,''%'',''%'',''1'',null,nvl((select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3202000''), 0) + 1,null,''18'');
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3202000'',null,null,''%'',''%'',null,null,nvl((select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3202000''), 0) + 1,'':DT_CURRENCY_NUM_CODE is not null and :DT_CURRENCY_NUM_CODE not in (''''810'''', ''''840'''',''''978'''')'',''19''); 
END;'
where feature_code = 'RESTRICTION_OF_CENTRAL_BANK_3202000';

--liquibase formatted sql
--changeset ivanovda:20220414-23381 stripComments:false

update feature
set 
feature_name = 'Выдача наличных средств со вклада (без закрытия). Ограничения Банка России',
feature_enable_script = 
'BEGIN 
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3201000'',null,null,''%'',''%'',''1'',null,nvl((select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3201000''), 0) + 1,null,''18'');
Insert into PROHIBITED_CORRESPOND (PROHIBITED_CORRESPOND_ID,SYSTEM_FUNCTION_ID,DR_ID_SYS_TYPE_CODE,CR_ID_SYS_TYPE_CODE,PC_EXT_TYPE_ACC_DR,PC_EXT_TYPE_ACC_CR,PC_CONVERSION_FLAG,PC_CHECK_AREA_ENUM,PC_CHECK_SN,PC_COND_EXPR,PROHIBITED_CORRESPOND_ERR_CODE) 
values (S_PROHIBITED_CORRESPOND.nextVal,''3201000'',null,null,''%'',''%'',null,null,nvl((select max(PC_CHECK_SN) from PROHIBITED_CORRESPOND where SYSTEM_FUNCTION_ID = ''3201000''), 0) + 1,'':DT_CURRENCY_NUM_CODE is not null and :DT_CURRENCY_NUM_CODE not in (''''810'''', ''''840'''',''''978'''')'',''19''); 
END;'
where feature_code = 'RESTRICTION_OF_CENTRAL_BANK_3201000';





