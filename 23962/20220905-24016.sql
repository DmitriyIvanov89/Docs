--liquibase formatted sql
--changeset ivanovda:20220905-24016 stripComments:false splitStatements:false

BEGIN
 FEATURE_PKG.ENABLE_FEATURE('OPER_LIM');
END;