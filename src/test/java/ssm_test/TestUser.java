package ssm_test;


import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.UserDao;
import com.dimension.pojo.User;

@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/springmvc-servlet.xml","classpath:spring-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {

	@Resource
	private UserDao userDao;
	@Test
		public void testUserDao(){
		List<User> users=userDao.searchUser();
		for (User user : users) {
			System.out.println(user);
		}
		}
}
