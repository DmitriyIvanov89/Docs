--liquibase formatted sql
--changeset ivanovda:20220415-23443 stripComments:false

insert /*+ ignore_row_on_dupkey_index(FEATURE_GROUP,PK_FEATURE_GROUP) */ into FEATURE_GROUP(FEATURE_GROUP_CODE, FG_NAME) 
values('LIMITATION_2', 'Ограничения на валютные наличные операции. Карты');

update feature
set feature_group_code = 'LIMITATION_2'
where feature_code = 'DISABLE_CHECK_EXPIRY_DATE_OF_CARD';

update feature
set feature_group_code = 'LIMITATION_2'
where feature_code = 'RESTRICTION_ON_TAKE_OUT_FROM_CARD_ONLY_RUB';

update feature
set feature_group_code = 'LIMITATION_2'
where feature_code = 'RESTRICTION_ON_PUT_ON_CARD_NO_CONVERSION_PROFILE';