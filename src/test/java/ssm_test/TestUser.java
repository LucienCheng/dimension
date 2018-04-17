package ssm_test;

import com.dimension.dao.CaseMapper;
import com.dimension.pojo.CaseCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
        "classpath:spring-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
    @Resource
    CaseMapper caseMapper;

    @Test
    public void user() {
        CaseCondition caseCondition = new CaseCondition();
        caseCondition.setRoleId(4);
        caseMapper.searchMapCases(caseCondition, null, null);

    }


}
