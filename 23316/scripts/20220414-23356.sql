--liquibase formatted sql
--changeset ivanovda:20220414-23356 stripComments:false

begin
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_3102030');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_3102040');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_7102030');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_7102040');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_3201000');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_3202000');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_3102060');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_3152010');
		feature_pkg.disable_feature('RESTRICTION_OF_CENTRAL_BANK_7152010');
end;