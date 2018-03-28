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
	//设置用户信息
	void setUser(User user,HttpSession session);
}
