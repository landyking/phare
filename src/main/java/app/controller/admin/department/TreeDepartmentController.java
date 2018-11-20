package app.controller.admin.department;

import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Department;
import org.beetl.sql.core.engine.CustomPageQuery;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class TreeDepartmentController extends AdminController {

    public static final String ROOT_PID = "0";

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String pid = superParam.getParam("pid", String.class, ROOT_PID);
        PageQuery<Department> query = new CustomPageQuery<>(superParam);
        query.setPageNumber(1);
        query.setPageSize(2000);
        PageQuery<Department> pageData = sql.pageQuery("departmentEx.listPageData", Department.class, query);

        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        List<Department> list = pageData.getList();
        Map<String, List<Department>> pidToDep = list.stream().collect(Collectors.groupingBy(Department::getPid));
        Assert.isTrue(!CollectionUtils.isEmpty(pidToDep.get(pid)), "根单位不存在");
        fillTree(data, pid, pidToDep);
        return jsonResult(rst);
    }

    private void fillTree(ArrayNode data, String pid, Map<String, List<Department>> pidToDep) {
        List<Department> list = pidToDep.get(pid);
        for (Department dep : list) {
            ObjectNode obj = data.addObject();
            QuickJson.fillFromPojo(obj, dep);
            if (!CollectionUtils.isEmpty(pidToDep.get(dep.getId()))) {
                fillTree(obj.putArray("children"), dep.getId(), pidToDep);
            }
        }
    }
}

