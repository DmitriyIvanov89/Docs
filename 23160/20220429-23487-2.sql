--liquibase formatted sql
--changeset ivanovda:20220429-23487-2 stripComments:false splitStatements:false
	
BEGIN
	SYSTEM_FUNCTION_PKG.ADD_TO_ROLE(5102094,12002);
END;