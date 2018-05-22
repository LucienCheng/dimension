package com.dimension.control.AdminControl;

import com.dimension.dao.MarkNodeMapper;
import com.dimension.pojo.*;
import com.dimension.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminControl {
    @Resource
    private UserService userService;
    @Resource
    MarkNodeMapper markNodeMapper;
    private static final int count = 10;
    //地图点位
    @RequestMapping("/nodeMap")
    public String nodeMap(Model model,HttpSession session) throws JsonProcessingException {
        ObjectMapper objectMapper=new ObjectMapper();
        User user=(User)session.getAttribute("user");

        model.addAttribute("markNodids",objectMapper.writeValueAsString(markNodeMapper.getMarkByUser(user.getId())));
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
