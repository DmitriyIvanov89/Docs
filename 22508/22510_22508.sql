22510:

update operation
set operation_del_flag = 1
where operation_code in ('0094','0095','1014','1015','1016','2501','2502','7001','9015','9017','2401','3501','3502','9501');

--2401 operation_del_flag = 1;

22508:

--liquibase formatted sql
--changeset ivanovda:20210901-22714 stripComments:false

INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('2414.MB','TRS24','pmtdoc2GL',null);
INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('3411.MB','TRS24','pmtdoc2GL',null);
INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('3413.MB','TRS24','pmtdoc2GL',null);

insert /*+ ignore_row_on_dupkey_index(FEATURE,PK_FEATURE) */ into FEATURE (FEATURE_CODE, FEATURE_GROUP_CODE, FEATURE_NAME, FEATURE_ENABLE_FLAG, FEATURE_ENABLE_SCRIPT, FEATURE_DISABLE_SCRIPT)
values ('CFT20_OPER_FRSOF624','CFT20_OPER','Применить изменения по FRSOF-624',0,'BEGIN
update OPERATION set workflow_id=46 where operation_code in (''2414.MB'',''3411.MB'',''3413.MB'');
END;','BEGIN
update OPERATION set workflow_id=41 where operation_code in (''2414.MB'',''3411.MB'',''3413.MB'');
END;');

22884:

insert /*+ ignore_row_on_dupkey_index(FEATURE,PK_FEATURE) */ into FEATURE (FEATURE_CODE, FEATURE_GROUP_CODE, FEATURE_NAME, FEATURE_ENABLE_FLAG, FEATURE_ENABLE_SCRIPT, FEATURE_DISABLE_SCRIPT)
values ('CFT20_OPER_FRSOF-896','CFT20_OPER','Применить изменения по Продажам монент',0,'BEGIN
update OPERATION set workflow_id=110 where operation_code in
(''5399'');
END;','BEGIN
update OPERATION set workflow_id = null where operation_code in
(''5399'');
END;');

INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ 
INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('5399','TRS24','pmtdoc2GL',null);


22849:

insert /*+ ignore_row_on_dupkey_index(FEATURE,PK_FEATURE) */ into FEATURE (FEATURE_CODE, FEATURE_GROUP_CODE, FEATURE_NAME, FEATURE_ENABLE_FLAG, FEATURE_ENABLE_SCRIPT, FEATURE_DISABLE_SCRIPT)
values ('CFT20_OPER_FRSOF-893','CFT20_OPER','Применить изменения по Наличным комиссиям',0,'BEGIN
update OPERATION set workflow_id=110 where operation_code in
(''2101'',''2105'',''2106'');
END;','BEGIN
update OPERATION set workflow_id=71 where operation_code in (''2106'');
update OPERATION set workflow_id=37 where operation_code in (''2105'');
update OPERATION set workflow_id = null where operation_code in
(''2101'');
END;');

INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('2101','TRS24','pmtdoc2GL',null);
INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('2105','TRS24','pmtdoc2GL',null);
INSERT /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ INTO OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('2106','TRS24','pmtdoc2GL',null);

-- проверка:

select workflow_id,operation_code from operation where operation_code in 
('5301','5302','5320','5321','5322','5323','5324','5325','5326','5360','5393','5394','5395','5396','5397','5398','5399','2101','2102','2105','2106','2118');

select * from operation2ext where operation_code in 
('5301','5302','5320','5321','5322','5323','5324','5325','5326','5360','5393','5394','5395','5396','5397','5398','5399','2101','2102','2105','2106','2118');