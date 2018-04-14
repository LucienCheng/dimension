package com.dimension.control.AdminControl;

import com.dimension.dao.UserMapper;
import com.dimension.pojo.User;
import com.dimension.pojo.UserCondition;
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
public class UserAdminControl {

    @Resource
    private UserMapper userMapper;
    private static final int count = 1;

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
        if (users.size() == 0&& start!=0) {
            start--;
            users = userMapper.selectUsers(userCondition, start * count, count);
        }

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
        user=userMapper.selectByPrimaryKey(user.getId());
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

}
