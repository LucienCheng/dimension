package com.dimension.control;

import com.dimension.dao.CaseMapper;
import com.dimension.dao.UserMapper;
import com.dimension.pojo.*;
import com.dimension.service.UserService;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
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
    @Resource
    private CaseMapper caseMapper;
    private static final int count = 1;


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

    //管理员案件管理,可以添加案件，并且设置组长
    @RequestMapping("/caseAdmin")
    public String caseAdmin(CaseCondition caseCondition,HttpSession session,Model model) {
        User user = (User) session.getAttribute("user");
        caseCondition.setDepartmentid(user.getDepartmentid());
        List<Case> cases=caseMapper.searchCases(caseCondition,0,count);
        int totalCount=caseMapper.count(caseCondition);
        int totalPage=(totalCount + count - 1) / count;
        JSONArray casesJson=new JSONArray(cases);
        model.addAttribute("cases",cases);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("casesJson",casesJson);
        model.addAttribute("currentPage",1);
        return "/admin/caseAdmin";
    }

    //管理员案件管理,可以添加案件，并且设置组长
    @RequestMapping("/caseAdmin/{start}")
    @ResponseBody
    public Map<String, Object> caseAdminAjax(CaseCondition caseCondition,HttpSession session, @PathVariable int start) {
        start--;
        User user = (User) session.getAttribute("user");
        caseCondition.setDepartmentid(user.getDepartmentid());
        List<Case> cases=caseMapper.searchCases(caseCondition,start*count,count);
        if (cases.size() == 0) {
            start--;
        }
        cases=caseMapper.searchCases(caseCondition,start*count,count);
        int totalCount=caseMapper.count(caseCondition);
        int totalPage=(totalCount + count - 1) / count;
        Map<String, Object> map = new HashMap<>();
        map.put("cases",cases);
        map.put("totalPage",totalPage);
        map.put("currentPage",start + 1);
        return map;
    }

    @RequestMapping("/deleteCase/{id}")
    public Map<String,Object> deleteCase(@PathVariable int id){
        Map<String, Object> map = new HashMap<>();
        caseMapper.deleteByPrimaryKey(id);
        return map;
    }


    @RequestMapping("/updateCase")
    @ResponseBody
    public Map<String, Object> updateCase(Case case1) {
        Map<String, Object> map = new HashMap<>();
        caseMapper.updateByPrimaryKeySelective(case1);
        map.put("case1", case1);
        return map;
    }

    @RequestMapping("/addCase")
    @ResponseBody
    public Map<String, Object> addUser(Case case1, Group group,GroupUser groupUser) {
        System.out.println(case1);
        System.out.println(group);
        System.out.println(groupUser);
        Map<String, Object> map = new HashMap<>();

        return map;
    }




    //管理用户
    @RequestMapping("/userAdmin")
    public String userAdmin(@ModelAttribute UserCondition userCondition, HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        //设置本部门的id
        userCondition.setDepartmentid(user.getDepartmentid());
        //设置用户的角色
        userCondition.setRoleId(user.getRoleid());
        userCondition.setSubDepartmentId(user.getSubDepartment());
        List<User> users = userMapper.selectUsers(userCondition, 0, count);
        int totalCount = userMapper.count(userCondition);
        int totalPage = (totalCount + count - 1) / count;
        JSONArray usersJson = new JSONArray(users);

        model.addAttribute("users", users);
        model.addAttribute("usersJson", usersJson);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", 1);
        return "/admin/userAdmin";
    }

    @RequestMapping("/userAdmin/{start}")
    @ResponseBody
    public Map<String, Object> userAdminAjax(@ModelAttribute UserCondition userCondition, HttpSession session, @PathVariable int start) {
        start--;
        User user = (User) session.getAttribute("user");
        //设置本部门的id
        userCondition.setDepartmentid(user.getDepartmentid());
        //设置用户的角色
        userCondition.setRoleId(user.getRoleid());
        userCondition.setSubDepartmentId(user.getSubDepartment());
        List<User> users = userMapper.selectUsers(userCondition, start * count, count);
        if (users.size() == 0) {
            start--;
        }
        users = userMapper.selectUsers(userCondition, start * count, count);
        int totalCount = userMapper.count(userCondition);
        int totalPage = (totalCount + count - 1) / count;
        Map<String, Object> map = new HashMap<>();
        map.put("users", users);
        map.put("totalPage", totalPage);
        map.put("currentPage", start + 1);
        return map;
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public Map<String, Object> updateUser(User user) {
        Map<String, Object> map = new HashMap<>();
        userMapper.updateByPrimaryKeySelective(user);
        map.put("user", user);
        return map;
    }

    @RequestMapping("/deleteUser/{id}")
    @ResponseBody
    public Map<String, Object> deleteUser(@PathVariable Integer id) {
        Map<String, Object> map = new HashMap<>();
        userMapper.deleteByPrimaryKey(id);
        return map;
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public Map<String, Object> addUser(User user) {
        Map<String, Object> map = new HashMap<>();
        user.setGeneratortime(new Date());
        userMapper.insertSelective(user);
        return map;
    }

    //个人信息
    @RequestMapping("/personInfo")
    public String personInfo() {
        return "/admin/personInfo";
    }

    @RequestMapping("/personInfoModify")
    @ResponseBody
    public User personInfoModify(User user, HttpSession session) {
        userService.setUser(user, session);
        return user;
    }

}
