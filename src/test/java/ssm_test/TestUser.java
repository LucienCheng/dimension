package ssm_test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;

@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
		"classpath:spring-mybatis.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
	@Resource
	private BaseNodeMapper baseNodeMapper;

	@Test
	public void testUserDao() {
		BaseNodeConditon baseNodeConditon=new BaseNodeConditon();
		baseNodeConditon.setRoleId(3);
		System.out.println(baseNodeMapper.selectEdited(baseNodeConditon).get(0).getNodeid());
	}
}
