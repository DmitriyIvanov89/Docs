-- Таблицы
OPER_JOURNAL --Данные по операциям
PMT_DOC --Данные по документам к операции
DEPT --Список точек продаж (ТП)
OPERATION --Список типов операций
PUBLIC_SERVICE_OJ --Список кассовых реестров
CLIENT --Данные по клиентам
IDENTITY_CARD_TYPE --Типы документов, удостоверяющих личность (ДУЛ)
IDENTITY_CARD --Список ДУЛ клиентов
PERSON --Данные по ФЛ
USERS --Таблица пользователей
EMP --Связь сотрудников с другими сущностями
EMP_ROLE --Список ролей

***********************************************************************
select * from svc_log 
where  to_char(sl_crt_time,'dd.mm.yyyy')='11.01.2018'
and dbms_lob.instr(SL_RESPONSE,hextoraw(rawtohex('516343468')))>0
order by svc_log_id desc;

***********************************************************************
-- Удаление неподтвержденной операции
update oper_journal set oj_status_enum = 4
where oper_journal_id = 1000172377;

update oper_journal set oper_status_show_code = 1
where oper_journal_id = 1000172377;

delete unconfirmed_operation
where oper_journal_id = 1000172377;

--Save changes
*************************************************************************
-- id операции на схеме TS и SP
-- id операции на схеме TS:
OPER_JOURNAL_EXT

OJE_EXT_ID -- id операции на SP
OPER_JOURNAL_ID -- на TS

--Если нужно вытащить id операции на схеме trs по id операции с sp, то это такой запрос

select * from svc_log where OPER_JOURNAL_ID in (
select oj.OPER_JOURNAL_ID from OPER_JOURNAL oj
join oper_journal_ext oje on oje.OPER_JOURNAL_ID = oj.OPER_JOURNAL_ID
where oje.ID_SYS_CODE='SCS_SPECTRUM'
and oje.OJE_EXT_ID like '%1000168055%')
order by 1 desc;

***************************************************************************
-- Параметр совместимости БД
SELECT name, value FROM v$parameter
WHERE name = 'compatible';

-- Версия БД
SELECT * FROM PRODUCT_COMPONENT_VERSION;

-- Построение скрипта по созданию таблицы
select dbms_metadata.get_ddl( 'TABLE', 'SVC_LOG', 'SP' ) from dual;- Значения всех contrains по таблице
select * from all_constraints where table_name = 'SVC_LOG';

-- Значения всех пользовательских индексов по таблице
select * from user_indexes where table_name = 'SVC_LOG';

-- Значения индексов по таблице
select * from ALL_INDEXES where table_name = 'SVC_LOG';

**************************************************************************
-- Экспорт глобальной статистики БД: 

1. EXEC DBMS_STATS.CREATE_STAT_TABLE('SP', 'STATS_TABLE');
2. exec dbms_stats.export_schema_stats(ownname => 'SP',stattab => 'STATS_TABLE');
3. expdp directory=DATA_PUMP_DIR dumpfile=stats.dmp logfile=stats.log tables=SP.STATS_TABLE
4. Прислать нам stats.dmp

-- Подробное описание: http://www.br8dba.com/export/.


*************************************************************************

-- Кол-во опреаций в месяц по коду операции

select count(oper_journal_id) as "Количество операций", to_char(oj_date,'month-yyyy') as "Месяц"
from oper_journal
where operation_code = '8132.2'
GROUP by to_char(oj_date,'month-yyyy')
order by 2 desc;

**************************************************************************

AN_ATTR - КБО / OPERATION2EXT - сохранения КБО

**************************************************************************

-- Права роли

select * from permission p
join role_permission rp
on p.permission_id = rp.permission_id
where rp.emp_role_id = 12005;

****************************************************************************************

-- таблица блокировок
select * from DATABASECHANGELOGLOCK;

*****************************************************************************************

-- поиск по BLOB
--<основной запрос> dbms_lob.instr(SL_RESPONSE,hextoraw(rawtohex('516343468')))>0;

******************************************************************************************

--функцтия для определения где открывается счет по id синтетики

select Spectrum_FO.getAccountIdByDeptSyntCcy(dept_id,id синтетики,валюта(126)) from dual;

*******************************************************************************************

-- посмотреть активные jobs:

select * from ALL_SCHEDULER_JOBS;
 
select * from dbms_obsolete_part;

*******************************************************************************************
--  Если что-то нужно достать из BLOB SVC_LOG.SL_CONTENT

SELECT sl.SVC_LOG_ID, 
       xt.*
    FROM SVC_LOG sl, 
        XmlTable('/Request/CurrencyRates'
                 PASSING XmlType(sl.SL_CONTENT,1)
                 COLUMNS "CourseDate"     VARCHAR2(200)   PATH 'CourseDate',
                          "CourseType"     VARCHAR2(200)   PATH 'CourseType',
                          "Filial"     VARCHAR2(200)   PATH 'filial',
                          "TZone"     VARCHAR2(200)   PATH 'zone') AS xt
WHERE sl.SVC_FUNC_ID = 51 
  AND sl.SL_CRT_TIME >= to_date('28.05.2021', 'dd.mm.yyyy')
  AND sl.SL_CRT_TIME <= to_date('28.06.2021', 'dd.mm.yyyy');
  
********************************************************************************************
-- выгрузка секции
-- в каждом запросе после выполнения выбрать: правй клик -> export -> Format: insert / Table name поменять на имя таблицы из запроса/ Save As : Clipboard -> сформированный скрипт вставить в текст.фаил

select * from public_service_prov where public_service_prov_code='номер секции';

select * from public_service_repmt where public_service_prov_code in (select public_service_prov_code from public_service_prov where public_service_prov_code='94452') and psr_del_flag=0;

select * from public_service_repmt_par where public_service_repmt_code  in (select public_service_repmt_code from public_service_repmt where public_service_prov_code in (select public_service_prov_code from public_service_prov where public_service_prov_code='номер секции' and psr_del_flag=0));

select * from public_service_repmt_par_l where public_service_repmt_par_code in (select public_service_repmt_par_code from public_service_repmt_par where public_service_repmt_code  in (select public_service_repmt_code from public_service_repmt where public_service_prov_code in (select public_service_prov_code from public_service_prov where public_service_prov_code='номер секции' and psr_del_flag=0)));

select * from public_service_repmt_par_map WHERE public_service_repmt_par_code in (select public_service_repmt_par_code from public_service_repmt_par where public_service_repmt_code  in (select public_service_repmt_code from public_service_repmt where public_service_prov_code in (select public_service_prov_code from public_service_prov where public_service_prov_code='номер секции' and psr_del_flag=0)));

**********************************************************************************************

select sp.* from sending_point sp
join sending_point_msg_type sm on sm.sending_point_code = sp.sending_point_code
join xml_outgoing_msg_type xo on xo.xml_outgoing_msg_type_code = sm.xml_outgoing_msg_type_code
join svc_func sf on sf.svc_name = xo.xomt_ext_code
where sf.svc_func_id in (34);

**********************************************************************************************
-- принадлежность синтетик счетов к ФЛ / ЮЛ:

select sas.*,sa_num,st.* from SYNT_ACC_SUBJECT_TYPE sas 
join synt_acc on synt_acc.SYNT_ACC_ID = sas.SYNT_ACC_ID
join SUBJECT_TYPE st on st.SUBJECT_TYPE_CODE = sas.SUBJECT_TYPE_CODE;

**********************************************************************************************

-- лимиты операций по клиентам:

select * from lim_rec order by 1 desc;

-- lim_rec.LR_OBJ_ID = client.CLIENT_ID

***********************************************************************************************
-- проводки по операциям:

select operation_code,(select sa_num from synt_acc where synt_acc_id=DEBIT_SYNT_ACC_ID) as dt,(select sa_num from synt_acc where synt_acc_id=CREDIT_SYNT_ACC_ID) as ct 
from pmt_doc where operation_code in (/*'operation_code'*/)
group by operation_code,DEBIT_SYNT_ACC_ID,CREDIT_SYNT_ACC_ID;

**********************************************************************************************

-- wf_step
-- шаги, выполняющиеся сценарием

*********************************************************************************************

--коды ОКУД:

select operation_code,operation_name,/*o.PRINT_TMPL_TYPE_ID,ptt.PTT_NAME,ptt.PTT_OKUD_CODE,ppt.PRINT_TMPL_TYPE_ID,ptt2.PTT_NAME,ptt2.PTT_OKUD_CODE,*/
case when o.PRINT_TMPL_TYPE_ID is not null then ptt.PTT_OKUD_CODE
     when o.PRINT_PACK_CODE is not null then ptt2.PTT_OKUD_CODE
     else null end as okud,
case when o.PRINT_TMPL_TYPE_ID is not null then ptt.PTT_NAME
     when o.PRINT_PACK_CODE is not null then ptt2.PTT_NAME
     else null end as name
from operation o
left join PRINT_TMPL_TYPE ptt on ptt.PRINT_TMPL_TYPE_ID = o.PRINT_TMPL_TYPE_ID
left join print_pack_tmpl ppt on ppt.PRINT_PACK_CODE = o.PRINT_PACK_CODE
left join PRINT_TMPL_TYPE ptt2 on (ptt2.PRINT_TMPL_TYPE_ID = ppt.PRINT_TMPL_TYPE_ID )
where operation_code in ('1051.BQ','1051.CFT', '1240.BQ', '1240.CFT','1241.BQ', '1241.CFT', '1242.BQ', '1242.CFT', '1243.BQ', '1243.CFT', '1244.BQ', '1244.CFT', '1245.BQ', '1245.CFT')
order by 1;

*************************************************************************************************

-- наименования полей по имени таблицы

select column_name from all_tab_columns where table_name = 'table_name'; -- table_name в верхнем регистре

*************************************************************************************************
-- вкл фичу без ui / через пакетную функцию
begin
    feature_pkg.ENABLE_FEATURE(FEATURE_CODE);
end;

-- выкл фичу без ui / через пакетную функцию

begin
    feature_pkg.DISABLE_FEATURE(FEATURE_CODE);
end;

*************************************************************************************************

select * from sending_point sp
join sending_point_msg_type smsg
on sp.sending_point_code = smsg.sending_point_code 
join xml_outgoing_msg_type xml
on smsg.xml_outgoing_msg_type_code = xml.xml_outgoing_msg_type_code 
join svc_func sf
on xml.xomt_ext_code = sf.svc_name 
where sf.svc_name in ('');

************************************************************************************************