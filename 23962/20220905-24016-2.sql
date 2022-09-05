--liquibase formatted sql
--changeset ivanovda:20220905-24016-2 stripComments:false splitStatements:false

update SYSTEM_FUNCTION
set
SF_PARAMETERS = 'printTmplTypeId=620;printParamList=pDeptId;'
where SYSTEM_FUNCTION_ID = '3013503';