package spectrum.bc.fo.transfer;

import java.sql.Types;

import oracle.jbo.domain.Number;

import org.apache.commons.lang3.StringUtils;

import ru.it_spectrum.core.dept.IDept;
import ru.it_spectrum.core.sql.SqlBlock;
import ru.it_spectrum.core.text.NumberUtils;

import spectrum.bc.fo.framework.SpectrumFoApplicationModuleImpl;
import spectrum.bc.fo.transfer.queries.FindProhibitedCorrespondViewImpl;
import spectrum.bc.fo.transfer.queries.FindProhibitedCorrespondViewRowImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Mon Oct 21 14:29:24 MSK 2019
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class TransferServiceImpl extends SpectrumFoApplicationModuleImpl implements ITransferService {

    private static final String NOT_SPECIFIED = "НеЗадано";
    private static final Number NOT_SPECIFIED_CONVERSION = new Number(-1);
    /**
     * This is the default constructor (do not remove).
     */
    public TransferServiceImpl() {
    }

    @Override
    public CheckTransferResult checkTransfer(CheckTransferData data) {
        CheckTransferSearch search = new CheckTransferSearch(getFindProhibitedCorrespondView());

        search.appendSystemFunctionId(data.getSystemFunctionId());

        if(data.getDebit().isEmpty()) {
            search.appendDebitAccountType(NOT_SPECIFIED);
            search.appendDebitIdSysTypeCode(NOT_SPECIFIED);
        } else {
            search.appendDebitAccountType(data.getDebit().getAccountType() == null ? NOT_SPECIFIED : data.getDebit().getAccountType());
            search.appendDebitIdSysTypeCode(data.getDebit().getIdSys() == null ? NOT_SPECIFIED : data.getDebit().getIdSys().getIdSysTypeCode());
        }

        if(data.getCredit().isEmpty()) {
            search.appendCreditAccountType(NOT_SPECIFIED);
            search.appendCreditIdSysTypeCode(NOT_SPECIFIED);
        } else {
            search.appendCreditAccountType(data.getCredit().getAccountType() == null ? NOT_SPECIFIED : data.getCredit().getAccountType());
            search.appendCreditIdSysTypeCode(data.getCredit().getIdSys() == null ? NOT_SPECIFIED : data.getCredit().getIdSys().getIdSysTypeCode());
        }

        if(data.getCredit().getCurrency() != null && data.getDebit().getCurrency() != null) {
            search.appendConversion(data.getCredit().getCurrency().equals(data.getDebit().getCurrency())
                                    ? NumberUtils.ZERO
                                    : NumberUtils.ONE);
        } else {
            search.appendConversion(NOT_SPECIFIED_CONVERSION);
        }

        search.appendRownumLimit(new Number(1)); // чтобы лишнего не тянуть

        CheckTransferResult result = new CheckTransferResult(data);

        getFindProhibitedCorrespondView()
            .rs()
            .loadAll()
            .stream()
            .filter(row -> isMatchToAdditionalCondition(data, row.getPcCondExpr()))
            .forEach(row -> result.addErrorMessage(row.getProhibitedCorrespondId(), createErrorMessage(data, row)));

        return result;
    }

    private String createErrorMessage(CheckTransferData data, FindProhibitedCorrespondViewRowImpl row) {
        if(StringUtils.isEmpty(row.getPceErrorMsg())) {
            return "Выбранная корреспонденция счетов-карт на данный момент не поддерживается";
        }

        if(!row.getPceErrorMsg().contains(":")) {
            return row.getPceErrorMsg();
        }

        SqlBlock sqlBlock = SqlBlock.ofSqlBlockService(this, SqlBlock.makeStringResultSqlBlockText(row.getPceErrorMsg()));

        registerParams(sqlBlock, data);

        sqlBlock.registerOutputParam("res", Types.VARCHAR);
        sqlBlock.execute();

        return (String) sqlBlock.getOutputParamValues().get("res");
    }

    /**
     * Container's getter for FindProhibitedCorrespondView.
     * @return FindProhibitedCorrespondView
     */
    public FindProhibitedCorrespondViewImpl getFindProhibitedCorrespondView() {
        return (FindProhibitedCorrespondViewImpl) findViewObject("FindProhibitedCorrespondView");
    }

    private void registerParams(SqlBlock sqlBlock, CheckTransferData data) {
        sqlBlock.tryToRegisterInputParam("DT_ACCOUNT_NUM", data.getDebit().getAccountNum());
        sqlBlock.tryToRegisterInputParam("CT_ACCOUNT_NUM", data.getCredit().getAccountNum());

        sqlBlock.tryToRegisterInputParam("DT_BC_NUMBER", data.getDebit().getBcNumber());
        sqlBlock.tryToRegisterInputParam("CT_BC_NUMBER", data.getCredit().getBcNumber());

        if(data.getDebit().getDept() != null) {
            IDept centralDept = getDeptService().getNearestCentralDept(data.getDebit().getDept().getDeptId());
            sqlBlock.tryToRegisterInputParam("DT_DEPT_SHORT_NAME", centralDept.getDeptShortName());
            sqlBlock.tryToRegisterInputParam("DT_DEPT_NAME", centralDept.getDeptName());
        } else {
            sqlBlock.tryToRegisterInputParam("DT_DEPT_SHORT_NAME", null);
            sqlBlock.tryToRegisterInputParam("DT_DEPT_NAME", null);
        }

        if(data.getCredit().getDept() != null) {
            IDept centralDept = getDeptService().getNearestCentralDept(data.getCredit().getDept().getDeptId());
            sqlBlock.tryToRegisterInputParam("CT_DEPT_SHORT_NAME", centralDept.getDeptShortName());
            sqlBlock.tryToRegisterInputParam("CT_DEPT_NAME", centralDept.getDeptName());
        } else {
            sqlBlock.tryToRegisterInputParam("CT_DEPT_SHORT_NAME", null);
            sqlBlock.tryToRegisterInputParam("CT_DEPT_NAME", null);
        }

        sqlBlock.tryToRegisterInputParam("DT_ID_SYS_CODE", data.getDebit().getIdSys() == null ? null : data.getDebit().getIdSys().getIdSysCode());
        sqlBlock.tryToRegisterInputParam("CT_ID_SYS_CODE", data.getCredit().getIdSys() == null ? null : data.getCredit().getIdSys().getIdSysCode());
        sqlBlock.tryToRegisterInputParam("DT_IS_NAME", data.getDebit().getIdSys() == null ? null : data.getDebit().getIdSys().getIsName());
        sqlBlock.tryToRegisterInputParam("CT_IS_NAME", data.getCredit().getIdSys() == null ? null : data.getCredit().getIdSys().getIsName());
        sqlBlock.tryToRegisterInputParam("DT_ID_SYS_TYPE_CODE", data.getDebit().getIdSys() == null ? null : data.getDebit().getIdSys().getIdSysTypeCode());
        sqlBlock.tryToRegisterInputParam("CT_ID_SYS_TYPE_CODE", data.getCredit().getIdSys() == null ? null : data.getCredit().getIdSys().getIdSysTypeCode());


        sqlBlock.tryToRegisterInputParam("DT_ACCOUNT_TYPE", data.getDebit().getAccountType());
        sqlBlock.tryToRegisterInputParam("CT_ACCOUNT_TYPE", data.getCredit().getAccountType());
    }

    private boolean isMatchToAdditionalCondition(CheckTransferData data, String condition) {
        if(StringUtils.isEmpty(condition)) {
            return true;
        }

        SqlBlock sqlBlock = SqlBlock.ofSqlBlockService(this, SqlBlock.makeDecisionSqlBlockText(condition));

        registerParams(sqlBlock, data);

        sqlBlock.registerOutputParam("res", Types.NUMERIC);
        sqlBlock.execute();
        Number resultValue = (Number) sqlBlock.getOutputParamValues().get("res");
        return resultValue.equals(NumberUtils.ONE);
    }
}
