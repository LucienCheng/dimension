package com.dimension.control;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dimension.pojo.User;
import com.dimension.service.UserService;


@Controller
public class LoginControl {
    @Resource
    private UserService userService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    //登陆界面
    public String login(String error, Model model) {
        System.out.println(error);
        model.addAttribute("error", error);

        return "login";
    }

    //认证一下用户
    @RequestMapping(value = "/verifyLogin", method = {RequestMethod.POST})
    public String verifyLogin(User user, HttpSession session) {

        boolean judge = userService.vertifyLogin(user, session);
        if (judge) {
            user = (User) session.getAttribute("user");
            if (user.getRoleid() == 2) {
                return "redirect:/user/nodeText";
            } else {
                return "redirect:/admin/nodeText";
            }
        } else {
            return "forward:/login?error=error";
        }
    }

    @RequestMapping(value = "/loginOut", method = {RequestMethod.GET})
    //登陆界面
    public String loginOut(HttpSession session) {
        userService.loginOut(session);
        return "login";
    }

}
