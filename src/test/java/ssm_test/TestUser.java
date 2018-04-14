package ssm_test;

import javax.annotation.Resource;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;

import com.dimension.dao.CaseMapper;
import com.dimension.dao.DepartmentMapper;
import com.dimension.dao.TableMapper;
import com.dimension.pojo.*;
import com.dimension.service.TableFieldService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.UserMapper;

import java.util.*;

@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
        "classpath:spring-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
    @Resource
    TableFieldService tableFieldService;
@Resource
    TableMapper tableMapper;
    @Test
    public void user() throws JsonProcessingException {

    }

    @Test
    public void table() {
        Table table=new Table();
        table.setChinesename("测试");
        table.setEnglishname("test");
        List<Field> fields=new ArrayList<>();
        Field field=new Field();
        field.setEnglishname("telephone");
        field.setChinesename("电话");
        field.setFieldtype("varchar(64)");
        fields.add(field);
        tableFieldService.createTable(table,fields);
    }
    @Test
    public void tableSearch() {
        Map<String,Object> map=new HashMap<>();
        map.put("table_4_4",7);
        map.put("nodeid",1);
        tableFieldService.setField("table_4",map);
    }
}
