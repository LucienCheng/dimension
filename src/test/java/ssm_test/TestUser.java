package ssm_test;

import javax.annotation.Resource;

import com.dimension.dao.DepartmentMapper;
import com.dimension.pojo.UserCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.UserMapper;
import com.dimension.pojo.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
		"classpath:spring-mybatis.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
@Resource
	UserMapper userMapper;
	@Test
	public void testUserDao() {
		UserCondition userCondition=new UserCondition();
		Long a[]={new Long(2),new Long(3)};
		userCondition.setSubDepartmentId(Arrays.asList(a));
		userMapper.selectUsers(userCondition,0,5);
		System.out.print(userMapper.count(userCondition));
		
	}
}
