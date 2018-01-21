package com.dimension.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dimension.service.UserService;


@Controller
public class BackLoginControl {
	@RequestMapping(value="/back",method={RequestMethod.GET})
	public String back(){
		return "/back/login";
	}
/*	@RequestMapping(value="/back/login",method={RequestMethod.POST})
	public String vertifyLogin(User user,HttpSession session){
		
	}
	@RequestMapping(value="/back/loginOut",method={RequestMethod.POST,RequestMethod.GET})
	public String loginOut(HttpSession session){
		session.invalidate();
		return "/back/login";
	}*/
}
