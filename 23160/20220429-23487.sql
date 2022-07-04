--liquibase formatted sql
--changeset ivanovda:20220429-23487 stripComments:false

Insert /*+ ignore_row_on_dupkey_index(SYSTEM_FUNCTION,PK_SYSTEM_FUNCTION) */ into SYSTEM_FUNCTION (SYSTEM_FUNCTION_ID,RETURN_FUNCTION_ID,PARENT_FUNCTION_ID,SF_NAME,SF_VIEW_ADDRESS,SF_PARAMETERS,SF_IMAGE_NAME,SF_ACCESS_VIEWS,SF_HOT_KEY,SF_USER_HELP,SF_POP_UP_WIN_EXECUTION_ENUM,SF_HELP_ADDR,SYSTEM_FUNCTION_CODE,APP_CODE,SF_HIDDEN_FLAG,IN_DEPT_GROUP_CODE,OUT_DEPT_GROUP_CODE)
values 
('5102094',null,'5102000',
'Переключение аннулирования операций по вкладам и АСВ через ЦФТ Savings','/adf.task-flow?adf.tfId=FeatureByParams' || CHR(38) || 'adf.tfDoc=/external/feature/FeatureByParams.xml',
'featureGroupCode=DEPOSIT_ON_CFTSAVINGS;title=Переключение аннулирования операций по вкладам и АСВ через ЦФТ Savings;namesOfButtons=Переключить на ЦФТ Savings,Отменить переключение на ЦФТ Savings',
null,null,null,null,'0',null,null,'5','0',null,null);
