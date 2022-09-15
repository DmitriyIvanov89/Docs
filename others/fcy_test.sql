declare fcy varchar(3);
begin
fcy :=
case
 when :OPERATION_FCY_CODE is not null then :OPERATION_FCY_CODE
 when (:DT_SYNT_ACC_NUM = '20202.0' and :DT_CURRENCY_ID <> 126 and :CT_SYNT_ACC_PERSON_FLAG = 1 and :CT_CURRENCY_ID <> 126)
   or (:DT_SYNT_ACC_NUM = '20202.0' and :DT_CURRENCY_ID <> 126 and :CT_ACCOUNT_NUM like '30301%' and :OTHER_BEN_ACCOUNT like '47422______72_______')
   or (:DT_SYNT_ACC_NUM = '20202.0' and :DT_CURRENCY_ID <> 126 and :CT_ACCOUNT_NUM like '47422________8888888' and :CT_CURRENCY_ID <> 126)
      then '60'
 when :DT_SYNT_ACC_NUM = '20202.0' and :DT_CURRENCY_ID <> 126 and :CT_SYNT_ACC_PERSON_FLAG = 1 and :CT_CURRENCY_ID = 126 then '61'
end;

:FCY_IN_CASH_N_CHK_SORT_CODE := fcy;
:res := case when fcy is null then 0 else 1 end;

end;