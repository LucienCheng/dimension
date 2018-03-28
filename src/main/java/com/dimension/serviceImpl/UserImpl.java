package com.dimension.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.dimension.dao.DepartmentMapper;
import com.dimension.pojo.*;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.dimension.dao.UserMapper;
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
			List<Long> list=new ArrayList<>();
			List<Department> departments=null;
			if (user1.getRoleid()!=2){
				//这是超级管理员
				if (user1.getRoleid()==3){
					departments=departmentMapper.subDepartment(user1.getDepartment().getLongnumber());
				}
				//部门管理员
				else if(user1.getRoleid()==4){
					departments=departmentMapper.subPartDepartment(user1.getDepartmentid());
				}

				for (Department department:departments) {
					list.add(department.getId());
				}
				user1.setSubDepartment(list);

				//设置department的json对象
				session.setAttribute("subDepartmentJson",new JSONArray(departments));
			}
			UserCondition userCondition=new UserCondition();
			userCondition.setRoleId(user1.getRoleid());
			userCondition.setDepartmentid(user1.getDepartmentid());

			List<User> users=userMapper.selectUsers(userCondition,null,null);
			session.setAttribute("user", user1);
			session.setAttribute("groupUsers",users);
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
	public void setUser(User user,HttpSession session) {
		userMapper.updateByPrimaryKeySelective(user);
		user=userMapper.vertifyUser(user);
        session.setAttribute("user",user);

	}



}
