--liquibase formatted sql
--changeset ivanovda:20220426-23250(???) stripComments:false

update operation
set mark_doc_code = '03ко',
debit_cash_symbol_code = null
where operation_code in ('1060');