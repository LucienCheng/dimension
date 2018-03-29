package com.dimension.control.UserControl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserControl {
    //普通用户的案件管理，只有是组长的时候才能管理案件信息，案件分配是由管理员创建的，这里只能修改案件信息
    @RequestMapping("/caseAdmin")
    public String caseAdmin() {
        return "/user/caseAdmin";
    }

    //消息处理，只能查看由管理员发来的消息
    @RequestMapping("/message")
    public String message() {
        return "/user/message";
    }

    //点位助手，提供案件点位比较和基础点位替换
    @RequestMapping("/nodeAssist")
    public String nodeAssist() {
        return "/user/nodeAssist";
    }

    //地图展示点位信息
    @RequestMapping("/nodeMap")
    public String nodeMap() {
        return "/user/nodeMap";
    }

    //文字展示点位的基本信息
    @RequestMapping("/nodeText")
    public String nodeText() {
        return "/user/nodeText";
    }

    //个人信息管理
    @RequestMapping("/personInfo")
    public String personInfo() {
        return "/user/personInfo";
    }


}
