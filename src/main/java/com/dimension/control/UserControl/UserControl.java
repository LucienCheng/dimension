package com.dimension.control.UserControl;

import com.dimension.dao.MarkNodeMapper;
import com.dimension.pojo.User;
import com.dimension.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserControl {
    @Resource
    private UserService userService;
    @Resource
    MarkNodeMapper markNodeMapper;
    private static final int count = 10;





    //地图点位
    @RequestMapping("/nodeMap")
    public String nodeMap(Model model, HttpSession session) throws JsonProcessingException {
        ObjectMapper objectMapper=new ObjectMapper();
        User user=(User)session.getAttribute("user");
        model.addAttribute("markNodids",objectMapper.writeValueAsString(markNodeMapper.getMarkByUser(user.getId())));
        return "/user/nodeMap";
    }

    //个人信息
    @RequestMapping("/personInfo")
    public String personInfo() {
        return "/user/personInfo";
    }

    @RequestMapping("/personInfoModify")
    @ResponseBody
    public User personInfoModify(User user, HttpSession session) {
        userService.setUser(user, session);
        return user;
    }

    //文本点位信息
    @RequestMapping("/node")
    public String node() {
        return "user/node";
    }

}
