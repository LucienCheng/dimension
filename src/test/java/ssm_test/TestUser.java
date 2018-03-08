package ssm_test;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.TableFieldMapper;

@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/springmvc-servlet.xml","classpath:spring-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
	@Resource
	private TableFieldMapper tableFieldMapper;
	@Test
		public void testUserDao(){
	
		}
}
