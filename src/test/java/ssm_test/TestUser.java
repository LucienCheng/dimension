package ssm_test;




import java.math.BigDecimal;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.pojo.BaseNode;



@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/springmvc-servlet.xml","classpath:spring-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
	@Resource
	private BaseNodeMapper baseNodeMapper;
	@Test
		public void testUserDao(){
		BaseNode baseNode=new BaseNode();
		BigDecimal sBigDecimal=new BigDecimal(113.0846840000);
		baseNode.setLongitude(sBigDecimal);
		baseNodeMapper.insertSelective(baseNode);
		System.out.println(baseNode);
		}
}
