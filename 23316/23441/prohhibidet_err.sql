--
-- # 2

update prohibited_correspond_err
set pce_error_msg = 'Снятие наличных денег в валюте текущего счета запрещено'
where prohibited_correspond_err_code in ('19');