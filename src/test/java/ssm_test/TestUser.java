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

import java.math.BigDecimal;
import java.util.*;

/*@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
        "classpath:spring-mybatis.xml"})*/
/*@RunWith(SpringJUnit4ClassRunner.class)*/
public class TestUser {

    @Test
    public void user() throws JsonProcessingException {
        double d=0.0001;

        BigDecimal decimal=new BigDecimal(3.11111);
        System.out.println(decimal.add(new BigDecimal(Double.valueOf(d*4))));

    }


}
