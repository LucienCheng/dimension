package com.dimension.service;



import javax.servlet.http.HttpSession;

import com.dimension.pojo.Group;
import com.dimension.pojo.GroupUser;
import com.dimension.pojo.User;

public interface UserService {
	//登陆
	boolean vertifyLogin(User user,HttpSession session);
	//登出
	void loginOut(HttpSession session);
	//添加用户
	void addUser(User user);
	
	//设置组长
	void setGroup(Group group);
	//删除组
	void deleteGroup(Group group);
	
	//设置组员
	void setGrouper(GroupUser groupUser);
	//删除组员
	void deleteGrouper(GroupUser groupUser);
	//设置用户信息
	void setUser(User user,HttpSession session);
	//删除用户
	void deleteUser(User user);
}
