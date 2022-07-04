insert /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ into OPERATION2EXT 
(OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('2091','TRS24','pmtdoc2GL',null);
insert /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ into OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('2093','TRS24','pmtdoc2GL',null);
insert /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ into OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('3093','TRS24','pmtdoc2GL',null);
insert /*+ ignore_row_on_dupkey_index(OPERATION2EXT, PK_OPERATION2EXT)*/ into OPERATION2EXT (OPERATION_CODE,ID_SYS_CODE,OE_EXT_ID,OE_ACC_EXPR) values ('3094','TRS24','pmtdoc2GL',null);

Предварительный варианты переключателя + примеры выгрузки в ЦФТ:

insert /*+ ignore_row_on_dupkey_index(FEATURE,PK_FEATURE) */ into FEATURE (FEATURE_CODE, FEATURE_GROUP_CODE, FEATURE_NAME, FEATURE_ENABLE_FLAG, FEATURE_ENABLE_SCRIPT, FEATURE_DISABLE_SCRIPT)
values ('CFT20_OPER_PROFILE','CFT20_OPER','Применить изменения по картам Profile',0,

'BEGIN
update OPERATION set workflow_id=120 where operation_code in (''2091'',''2093'');
update OPERATION set workflow_id=130 where operation_code in (''3093'',''3094'');
update OPERATION2EXT set OE_EXT_ID = ''cardInt2cash.Profile'' where OPERATION_CODE in (''2091'',''2093'',''3093'', ''3094'') and ID_SYS_CODE = ''TRS24'';
END;',

'BEGIN
update OPERATION set workflow_id=39 where operation_code in (''2091'',''2093'',''3093'',''3094'');
update OPERATION2EXT set OE_EXT_ID = ''cash2cardInt.Profile'' where OPERATION_CODE in (''2091'', ''2093'') and ID_SYS_CODE = ''TRS24'';
update OPERATION2EXT set OE_EXT_ID = ''cardInt2cash.Profile.old'' where OPERATION_CODE in (''3093'', ''3094'') and ID_SYS_CODE = ''TRS24'';
END;');


*********** igorolv 22240 MB *********************

insert into FEATURE
(
    FEATURE_CODE,
    FEATURE_GROUP_CODE,
    FEATURE_NAME,
    FEATURE_ENABLE_FLAG,
    FEATURE_ENABLE_SCRIPT,
    FEATURE_DISABLE_SCRIPT) 
select 'CFT20_OPER_ТЗ22240',
       'CFT20_OPER',
       'Применить изменения по BR-20875',
       0,
'begin
update OPERATION set WORKFLOW_ID = 120 where OPERATION_CODE in (''2071'', ''2072'');
update OPERATION set WORKFLOW_ID = 130 where OPERATION_CODE in (''3071'', ''3072'');
update OPERATION2EXT set OE_EXT_ID = ''cash2cardInt.MBank'' where OPERATION_CODE in (''2071'', ''2072'') and ID_SYS_CODE = ''TRS24'';
update OPERATION2EXT set OE_EXT_ID = ''cardInt2cash.Profile'' where OPERATION_CODE in (''3071'', ''3072'') and ID_SYS_CODE = ''TRS24'';
end;',
'begin
update OPERATION set WORKFLOW_ID = 35 where OPERATION_CODE in (''2071'', ''2072'');
update OPERATION set WORKFLOW_ID = 39 where OPERATION_CODE in (''3071'', ''3072'');
update OPERATION2EXT set OE_EXT_ID = ''cash2cardInt.MBank.old'' where OPERATION_CODE in (''2071'', ''2072'') and ID_SYS_CODE = ''TRS24'';
update OPERATION2EXT set OE_EXT_ID = ''cardInt2cash.Profile.old'' where OPERATION_CODE in (''3071'', ''3072'') and ID_SYS_CODE = ''TRS24'';
end;'
  from dual;