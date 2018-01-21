package com.dimension.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimension.dao.UserDao;
import com.dimension.pojo.User;
import com.dimension.service.UserService;
@Service
public class UserImpl implements UserService{
@Resource
private UserDao userDao;
private String s;
	@Override
	public boolean vertifyLogin(User user) {
		// TODO Auto-generated method stub
		return false;
	}

}
