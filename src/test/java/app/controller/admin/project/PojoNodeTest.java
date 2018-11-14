package app.controller.admin.project;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.ValueNode;
import gen.Project;
import org.junit.Test;
import org.springframework.cglib.beans.BeanMap;

import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

import static org.junit.Assert.*;

/**
 * Created by landy on 2018/11/14.
 */
public class PojoNodeTest {
    @Test
    public void test1() throws Exception {
        ObjectNode obj = QuickJson.newObject();
        obj.put("hello", "world");
        Project project = new Project();
        project.setId(Texts.uuidLong());
        project.setName("p001");
        project.setDescription("desc001");
        project.setCreateTime(DateTimeTool.now());
        QuickJson.fillFromPojo(obj, project);
        System.out.println(QuickJson.toJsonString(obj));

    }
}