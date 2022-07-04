--liquibase formatted sql
--changeset ivanovda:20220429-23487 stripComments:false

Insert /*+ ignore_row_on_dupkey_index(FEATURE_GROUP,PK_FEATURE_GROUP) */  into FEATURE_GROUP (FEATURE_GROUP_CODE,FG_NAME) 
values ('DEPOSIT_ON_CFTSAVINGS','Переключение аннулирования операций по вкладам и АСВ через ЦФТ Savings');

Insert /*+ ignore_row_on_dupkey_index(FEATURE,PK_FEATURE) */ into FEATURE (FEATURE_CODE, FEATURE_GROUP_CODE, FEATURE_NAME, FEATURE_ENABLE_FLAG, FEATURE_ENABLE_SCRIPT, FEATURE_DISABLE_SCRIPT) 
values ('DEPOSIT_AND_ASV_CANCEL_ON_CFT2SAVINGS','DEPOSIT_ON_CFTSAVINGS','Аннулирование операций по вкладам и АСВ через ЦФТ Savings',0,

'BEGIN
update SENDING_POINT set LINK_CODE = 7, SP_ENABLE_FLAG = 1 where SENDING_POINT_CODE in (-81);    
END;',

'BEGIN   
UPDATE SENDING_POINT SET SP_ENABLE_FLAG = 0, LINK_CODE = 0 WHERE SENDING_POINT_CODE in (-81);        
END;');