package app.controller.admin.system;

import app.common.ProgramInfo;
import app.common.QuickJson;
import app.common.Tuple;
import app.common.VersionUtils;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author: landy
 * @date: 2018-10-27 13:37
 */
@Component
public class ListSystemInfoController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        List<Tuple<String, String>> props = Lists.newArrayList();
        props.add(Tuple.newOne("软件版本", VersionUtils.APP_VERSION));
        props.add(Tuple.newOne("线程数量", String.valueOf(ProgramInfo.getThreadCount())));
        props.add(Tuple.newOne("内存占用", ProgramInfo.getMemoryInfo()));
        props.add(Tuple.newOne("运行时间", ProgramInfo.getUpTime()));
        props.add(Tuple.newOne("PID", ProgramInfo.getPID()));
        props.add(Tuple.newOne("启动用户", ProgramInfo.getOSUser()));
        props.add(Tuple.newOne("操作系统", ProgramInfo.getOSnfo()));
        props.add(Tuple.newOne("Tomcat HOME", ProgramInfo.getTomcatHome()));
        props.add(Tuple.newOne("Tomcat Base", ProgramInfo.getTomcatBase()));
        props.add(Tuple.newOne("JAVA HOME", ProgramInfo.getJVMHome()));
        props.add(Tuple.newOne("JAVA Vendor", ProgramInfo.getJVMVendor()));
        props.add(Tuple.newOne("JAVA Version", ProgramInfo.getJVMVersion()));
        props.add(Tuple.newOne("本机IP", ProgramInfo.getIpInfo()));

        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", props.size());
        rst.putPOJO("data", props);
        return jsonResult(rst);
    }
}
