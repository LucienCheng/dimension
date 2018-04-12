package com.dimension.control.AdminControl;

import com.dimension.pojo.*;
import com.dimension.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminControl {
    @Resource
    private UserService userService;
    private static final int count = 1;




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
