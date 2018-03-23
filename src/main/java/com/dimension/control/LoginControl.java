package com.dimension.control;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dimension.pojo.User;
import com.dimension.service.UserService;


@Controller
public class LoginControl {
	@Resource
	private UserService userService;
	@RequestMapping(value="/login",method={RequestMethod.GET})
	//登陆界面
	public String login(){
		return "login";
	}
	//认证一下用户
	@RequestMapping(value="/vertify",method={RequestMethod.POST})
	public String vertifyLogin(User user,HttpSession session){
		boolean judge=userService.vertifyLogin(user, session);
		if (judge) {
			user=(User) session.getAttribute("user");
			if (user.getRoleid()==2) {
				return "forward:/user/nodeText";
			}else {
				return "forward:/admin/nodeText";
			}
			
		}
		else {
			return "forward:/login";
		}
	}
	@RequestMapping(value="/loginOut",method={RequestMethod.GET})
	//登陆界面
	public String loginOut(HttpSession session){
		userService.loginOut(session);
		return "login";
	}
	
}
