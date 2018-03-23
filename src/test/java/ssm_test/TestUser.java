package ssm_test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.UserMapper;
import com.dimension.pojo.User;

@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
		"classpath:spring-mybatis.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
	@Resource
	private UserMapper userMapper;

	@Test
	public void testUserDao() {
		User user=new User();
		user.setPassword("1245");
		user.setIdentityid("415454");
	User	user1=userMapper.vertifyUser(user);
	System.out.println(user1);
		
	}
}
