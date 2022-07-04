--liquibase formatted sql
--changeset ivanovda:20220415-23443-3 stripComments:false splitStatements:false

BEGIN
	SYSTEM_FUNCTION_PKG.ADD_TO_ROLE(2809500,12002);
END;