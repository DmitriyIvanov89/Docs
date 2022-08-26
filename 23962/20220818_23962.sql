INSERT INTO SP.EXPR
(EXPR_ID, EXPR_NAME, EXPR_TYPE_CODE, EXPR_SCOPE_CODE, EXPR_TEXT, EXPR_CODE)
VALUES(-11, 'Продажа_Базовая сумма минус процент филиала от базовой суммы, если по ДТ валютная касса', 'groovy', 'OPER_LIM', 'return doc.cashDecrease & doc.creditSumma.foreignCurrency ? baseSum.subtract(baseSum.multiply(service.getParamService().getParamValueGlobalNumber("LIMITATION_SALE_PERCENT").divide(100))) : null', 'BASE_SUM_MINUS_LSP');

INSERT INTO SP.EXPR
(EXPR_ID, EXPR_NAME, EXPR_TYPE_CODE, EXPR_SCOPE_CODE, EXPR_TEXT, EXPR_CODE)
VALUES(-12, 'Продажа_Процент филиала от базовой суммы, если по ДТ валютная касса', 'groovy', 'OPER_LIM', 'return doc.cashDecrease & doc.creditSumma.foreignCurrency ? baseSum.multiply(service.getParamService().getParamValueGlobalNumber("LIMITATION_SALE_PERCENT").divide(100)) : null', 'BASE_SUM_LSP');

update SP.OPER_LIM_OPERATION_GROUP
set
check_expr_id = '-2'
where oper_lim_id = '-1'
and operation_group_code = '-26';

update SP.OPER_LIM_OPERATION_GROUP
set
SUB_DELTA_EXPR_ID = '-12'
where OPER_LIM_ID = '-2'
and OPERATION_GROUP_CODE = '-26';

update SP.OPER_LIM_OPERATION_GROUP
set
SUB_DELTA_EXPR_ID = '-11'
where OPER_LIM_ID = '-1'
and OPERATION_GROUP_CODE = '-26';

