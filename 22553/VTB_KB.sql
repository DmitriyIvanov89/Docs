Insert into PUBLIC_SERVICE_PROV (PUBLIC_SERVICE_PROV_CODE,PSP_NAME,PSP_DEL_FLAG,PSP_TRANSIT_ACC_NUM,PSP_EXT_ID,CNTRPARTY_CODE,PUBLIC_SERVICE_PROV_TYPE_CODE,PROC_DEPT_ID,PSP_DESC,PSP_BEGIN_DATE,PSP_END_DATE,PSP_IDENTITY_LEVEL_ENUM,PMT_GTWY_CODE) values ('94452','Перевод в адрес ООО ВТБ Капитал Брокер','0',null,null,null,null,null,'Перевод в адрес ООО ВТБ Капитал Брокер',to_date('02.08.21 00:00:00','DD.MM.RR HH24:MI:SS'),to_date('26.08.29 00:00:00','DD.MM.RR HH24:MI:SS'),'1','3');

Insert into PUBLIC_SERVICE_REPMT (PUBLIC_SERVICE_REPMT_CODE,PUBLIC_SERVICE_TYPE_CODE,PUBLIC_SERVICE_PROV_CODE,OPERATION_CODE,ACCOUNT_ID,PSR_NAME,REGION_CODE,PSR_MIN_AMOUNT,PSR_MAX_AMOUNT,PSR_DEL_FLAG,PSR_AMOUNT_ADD_COND,PSR_AMOUNT_ADD_COND_ERROR_MSG,PSR_HB_PAGE_ADDR,PSR_HB_VIEW_SN,PSR_VISIBLE_FLAG,PSR_FEE_FOR_CREDIT_FLAG,CNTRPARTY_CODE,PSR_EXT_ID,REQ_TYPE_CODE,PSR_AUTO_TRANSITION_FLAG,PSR_AMOUNT_USING_ENUM,PSR_TMPL_SCRIPT_URL,ACC_OPER_SS_CODE,PSR_REGION_MODE_ENUM) values ('25003638','1','94452',null,null,'Перевод в адрес ООО ВТБ Брокер',null,'20',null,'0',null,null,null,null,'1','0',null,'Default',null,'0','2',null,null,'0');

Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638100','25003638','1','ИНН плательщика','"0" или 5,10,12-значный код','(?!^7702070139$)([0]|.{0}|\d{5}|\d{10}|\d{12})','Значение параметра "ИНН плательщика" не соответствует формату','0','1','0',null,'0',null,null,'0','60','0','0','30','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638110','25003638','1','КПП плательщика (102)','"0" или 9-значный цифровой код','[0]|.{0}|\d{9}','Значение параметра "КПП плательщика (102)" не соответствует формату','0','1','0',null,'0',null,null,'0','102','0','0','110','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638010','25003638','7','Сумма платежа','Минимальная сумма 20 руб.','.*','Параметр "Сумма платежа" заполнен неправильно','1','0','0',null,'0',null,null,'1','Amount','1','0','10','1',null,'0',null,null,null,'1',null,null,null,null,'0','AmountHdlr');
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638030','25003638','6','Идентификация платежа',null,'.*','Параметр "Идентификация платежа" заполнен неправильно','0','0','0','3','0',null,null,'0','IdentifyLevel','0','0','20','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638111','25003638','1','Номер договора','7 символов','.{7}','Номер договора не соответствует формату','1','1','0',null,'0',null,null,'1','123','1','0',null,'1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638060','25003638','1','ИНН получателя','5,10 или 12-значный код','.{0}|\d{5}|\d{10}|\d{12}','Значение параметра "ИНН получателя" не соответствует формату','1','1','0','7702668793','0',null,null,'0','61','0','0','40','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638050','25003638','1','Наименование получателя','текст до 160 символов','.{0,160}','Значение параметра "Наименование получателя" не соответствует формату','1','1','0','ООО ВТБ Капитал Брокер','0','EditTextAttr',null,'0','16','0','0','45','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638120','25003638','1','БИК банка получателя','9-значный цифровой код','\d{9}','Значение параметра "БИК банка получателя" не соответствует формату','1','1','4','044525505','0','EditBICAttr',null,'0','14','0','0','50','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638040','25003638','1','Счет получателя','20-значный цифровой код','\d{20}','Значение параметра "Счет получателя" не соответствует формату','1','1','0','30411810000001001190','0','EditAcctAttr','Param_BICCode=120;','0','17','0','0','60','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638020','25003638','6','Кассовый символ',null,'.*','Параметр "Кассовый символ" заполнен неправильно','1','0','0','32','0','EditSimbolAttr',null,'0','Simbol','0','0','70','1',null,'0',null,null,null,'1',null,null,null,null,'0','EditCashSymbolHdlr');
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638130','25003638','8','Назначение платежа','текст до 210 символов','.{0,210}','Назначение платежа не должно превышать 210 символов','1','1','0','Перечисление денежных средств по ДОФР N______ от __/__/20__г. для совершения операций','0','EditNoteNDSAttr',null,'0','24','0','0','80','1',null,'2',null,null,null,'1',null,null,null,null,'0','EditPmtDetailsHdlr');
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638222','25003638','3','Дата договора','Формат даты: ДД.ММ.ГГГГ','.*','Значение даты не соответствует формату','1','1','0',null,'0',null,null,'1','222','1','0',null,'1',null,'0',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638025','25003638','1','Информация о НДС',null,'.*','Параметр "Информация о НДС" заполнен неправильно','0','0','0','НДС не облагается','0',null,null,'0','InfoNDS','0','0','85','1',null,'2',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638333','25003638','1','Торговая площадка','Выбрать из списка торговую площадку','.*','Торговая площадка не выбрана','1','1','1',null,'0',null,null,'1','333','1','0','83','1',null,'2',null,null,null,'1',null,null,null,null,'0',null);
Insert into PUBLIC_SERVICE_REPMT_PAR (PUBLIC_SERVICE_REPMT_PAR_CODE,PUBLIC_SERVICE_REPMT_CODE,VAL_TYPE_CODE,PSRP_NAME,PSRP_DESC,PSRP_MASK,PSRP_ERROR_MSG,PSRP_MANDATORY_FLAG,PSRP_MODE_ENUM,PSRP_USE_LIST_ENUM,PSRP_DEFAULT_VALUE,PSRP_PRINT_FLAG,PSRP_DICT_NAME,PSRP_EXTRA_PROP,PSRP_VISIBLE_FLAG,PSRP_EXT_ID,PSRP_MOD_FLAG,PSRP_DEL_FLAG,PSRP_VIEW_SN,PSRP_DESC_VIEW_METHOD_ENUM,PSRP_VIEW_ON_STEPS,PSRP_PMT_DETAILS_ENUM,PSRP_EXTRA_DESC_HEADER,PSRP_EXTRA_DESC,PSRP_VIEW_EXPR,PSRP_VIEW4EMPTY_FLAG,PSRP_MIN_VALUE,PSRP_MAX_VALUE,PSRP_VIEW_ON_BLOCK,PSRP_WS_PAR_NAME,PSRP_KEY_FLAG,PUBLIC_SERVICE_REPMT_HDLR_CODE) values ('25003638070','25003638','1','КПП получателя (103)','"0" или 9-значный код в формате NNNNPPNNN','(\d{4}[A-Z0-9]{2}\d{3})|0','Значение параметра "КПП получателя (103)" не соответствует формату','1','1','0','770301001','0',null,null,'0','103','0','0','120','1',null,'0',null,null,null,'1',null,null,null,null,'0',null);

Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','для ВНБ сделок: "OTC"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на DMA (иностранные площадки): "DMA"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на Валютном рынке: "WITH FX" или "(FX)" или "MICEXFX" или "MICEX FX" или "ВАЛЮТ"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на Фондовом рынке Московской биржи Т0 и Т+ / на Внебиржевом рынке ценных бумаг (RUR):"ЦБ"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на Валютном рынке Московской биржи (RUR):"ин.валютой (FX)"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на Срочном рынке: "FORTS" или "ФОРТС" или "ФИСС"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на Фондовом рынке: "MICEX"',null);
Insert into PUBLIC_SERVICE_REPMT_PAR_L (PUBLIC_SERVICE_REPMT_PAR_CODE,PSRPL_VALUE,PSRPL_DESC) values ('25003638333','на Cрочном рынке ФОРТС (RUR): "ФОРТС"',null);

insert into public_service_repmt_par_c (public_service_repmt_par_code,public_service_repmt_par_c_sn,PSRPC_CONSTRAINT_EXPR,PSRPC_ERROR_MSG)
values (
(select public_service_repmt_par_code from public_service_repmt_par where public_service_repmt_code in 
(select public_service_repmt_code from public_service_repmt where public_service_prov_code in 
(select public_service_prov_code from public_service_prov where public_service_prov_code='94452')) and psrp_name like 'Сумма платежа%'),1,'field >= 20','Значение параметра "%1s" не может быть меньше 20');