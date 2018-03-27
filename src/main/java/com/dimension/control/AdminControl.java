package com.dimension.control;

import com.dimension.dao.UserMapper;
import com.dimension.pojo.User;
import com.dimension.pojo.UserCondition;
import com.dimension.service.UserService;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.json.Json;
import javax.json.JsonArray;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.ViewportUI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminControl {
	@Resource
	private UserService userService;
	@Resource
	private UserMapper userMapper;
	private static final int count=1;
	//管理员案件管理,可以添加案件，并且设置组长
	@RequestMapping("/caseAdmin")
	public String caseAdmin() {
		return "/admin/caseAdmin";
	}
	//查看信息，并且回复信息，并设置信息为无效
	@RequestMapping("/message")
	public String message() {
		return "/admin/message";
		
	}
	//点位点位的类型管理
	@RequestMapping("/nodeType")
	public String nodeType() {
		return "/admin/nodeType";
	}
	//点位比较
	@RequestMapping("/nodeCompare")
	public String nodeCompare() {
		return "/admin/nodeCompare";
	}
	//点位替换
	@RequestMapping("/nodeReplace")
	public String nodeReplace() {
		return "/admin/nodeReplace";
	}
	//地图点位
	@RequestMapping("/nodeMap")
	public String nodeMap() {
		return "/admin/nodeMap";
	}
	//文本点位信息
	@RequestMapping("/nodeText")
	public String nodeText() {
		return "/admin/nodeText";
	}
	//个人信息
	@RequestMapping("/personInfo")
	public String personInfo() {
		return "/admin/personInfo";
	}
	@RequestMapping("/personInfoModify")
	@ResponseBody
	public User personInfoModify(User user,HttpSession session) {
		userService.setUser(user,session);
		return user;
	}
	//管理用户
	@RequestMapping("/userAdmin")
	public String userAdmin(@ModelAttribute UserCondition userCondition, HttpSession session,Model model) {

		User user= (User) session.getAttribute("user");
		userCondition.setSubDepartmentId(user.getSubDepartment());
		List<User> users=userMapper.selectUsers(userCondition,0,count);
		int totalCount=userMapper.count(userCondition);
		int totalPage=(totalCount  +  count  - 1) / count;
		JSONArray usersJson=new JSONArray(users);
		model.addAttribute("users",users);
		model.addAttribute("usersJson",usersJson);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("currentPage",1);
		return "/admin/userAdmin";
	}

	@RequestMapping("/userAdmin/{start}")
	@ResponseBody
	public Map<String,Object> userAdminAjax(@ModelAttribute UserCondition userCondition, HttpSession session,@PathVariable int start) {
		start--;
		User user= (User) session.getAttribute("user");
		userCondition.setSubDepartmentId(user.getSubDepartment());
		List<User> users=userMapper.selectUsers(userCondition,start*count,count);
		if (users.size()==0){
			start--;
		}
		users=userMapper.selectUsers(userCondition,start*count,count);
		int totalCount=userMapper.count(userCondition);
		int totalPage=(totalCount  +  count  - 1) / count;
		Map<String,Object> map=new HashMap<>();
		map.put("users",users);
		map.put("totalPage",totalPage);
		map.put("currentPage",start+1);
		return map;
	}
	@RequestMapping("/updateUser")
	@ResponseBody
	public Map<String,Object> updateUser(User user){
		Map<String,Object> map=new HashMap<>();
		userMapper.updateByPrimaryKeySelective(user);
		map.put("user",user);
		return map;
	}

	@RequestMapping("/deleteUser/{id}")
	@ResponseBody
	public Map<String,Object> deleteUser(@PathVariable Integer id){
		Map<String,Object> map=new HashMap<>();
		userMapper.deleteByPrimaryKey(id);
		return map;
	}

}
