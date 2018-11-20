package app.controller.admin.departmentControl;

import app.common.DateTimeTool;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import gen.DepartmentControl;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.function.Function;

import static java.util.stream.Collectors.toList;

@Component
public class GrantDepartmentControlController extends AdminController {
    @Resource
    private TransactionTemplate transactionTemplate;

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String depIds = superParam.getParam("depIds", String.class);
        Integer type = superParam.needParam("type", Integer.class);
        String userId = superParam.needParam("userId", String.class);

        List<DepartmentControl> controls = Texts.splitToList(depIds).stream().map(s -> {
            DepartmentControl dc = new DepartmentControl();
            dc.setId(Texts.uuidLong());
            dc.setDepId(s);
            dc.setUserId(userId);
            dc.setType(type);
            dc.setCreateTime(DateTimeTool.nowLong());
            return dc;
        }).collect(toList());
        transactionTemplate.execute(new TransactionCallbackWithoutResult() {
            @Override
            protected void doInTransactionWithoutResult(TransactionStatus transactionStatus) {
                sql.lambdaQuery(DepartmentControl.class).andEq(DepartmentControl::getUserId, userId)
                        .andEq(DepartmentControl::getType, type)
                        .delete();
                if (!controls.isEmpty()) {
                    sql.insertBatch(DepartmentControl.class, controls);
                }
            }
        });
        return jsonResultSuccess();
    }
}

