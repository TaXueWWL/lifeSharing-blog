import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.admin.bean.User;
import com.blog.admin.mapper.ManageUserDaoImpl;


public class TestUserDao {
	
	private ManageUserDaoImpl manageUserDaoImpl;

	@SuppressWarnings("resource")
	@Before
	public void setUp() throws Exception {
		// 完成UserService的初始化
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext*.xml");
		this.manageUserDaoImpl = (ManageUserDaoImpl) applicationContext.getBean("manageUserDaoImpl");
	}

	@Test
	public void test() {
		System.out.println(manageUserDaoImpl.fetchEntityRowsAccount());
		System.out.println("*******************");
		System.out.println(manageUserDaoImpl.findEntityRecords(1, 10).size());
	}
	
	@Test
	public void testUpdateUser() {
		System.out.println(
					manageUserDaoImpl.updateUserInfo(User.builder().u_id(1).userName("Anonymous").userMobile("123123").updated(new Date()).build())
				);
	}

}
