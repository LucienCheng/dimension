package com.dimension.serviceImpl;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.dimension.dao.DepartmentMapper;
import org.springframework.stereotype.Service;

import com.dimension.dao.UserMapper;
import com.dimension.pojo.Group;
import com.dimension.pojo.GroupUser;
import com.dimension.pojo.User;
import com.dimension.service.UserService;

@Service
public class UserImpl implements UserService {
	@Resource
	private UserMapper userMapper;
	@Resource
	private DepartmentMapper departmentMapper;

	@Override
	public boolean vertifyLogin(User user, HttpSession session) {
		User user1 = userMapper.vertifyUser(user);
		System.out.println(user1);
		if (user1 != null) {
			user1.setSubDepartment(departmentMapper.subDepartment(user1.getDepartment().getLongnumber()));
			session.setAttribute("user", user1);
			user1.setLogintime(new Date());
			userMapper.updateByPrimaryKeySelective(user1);
			return true;
		}
		return false;
	}

	@Override
	public void loginOut(HttpSession session) {
		// 设置session无效
		System.out.println("登出");
		session.invalidate();

	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setGroup(Group group) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteGroup(Group group) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setGrouper(GroupUser groupUser) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteGrouper(GroupUser groupUser) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setUser(User user,HttpSession session) {
		userMapper.updateByPrimaryKeySelective(user);
		user=userMapper.vertifyUser(user);
        session.setAttribute("user",user);

	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

}
