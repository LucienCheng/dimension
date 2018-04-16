package com.dimension.control.AdminControl;

import com.dimension.pojo.User;
import com.dimension.service.NodeAssit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class ReplaceControl {
    @Resource
    NodeAssit nodeAssit;
    //点位替换
    @RequestMapping("/nodeReplace")
    public String nodeReplace(HttpSession session, Model model) {
        User user=(User) session.getAttribute("user");
        model.addAttribute("baseNodes",nodeAssit.getRepalceNode(user));
        return "/admin/nodeReplace";
    }
    @RequestMapping("/nodeReplace/solve/{nodeid}")
    @ResponseBody
    public  Map<String,Object> solve(@PathVariable Long nodeid) {
        Map<String,Object> map=new HashMap<>();
        map.put("needReplacedNode",nodeAssit.getNeedReplacedNode(nodeid));
        return map;
    }
    @RequestMapping("/nodeReplace/ignore/{nodeid}")
    @ResponseBody
    public Map<String,Object> ignore(@PathVariable Long nodeid) {
        Map<String,Object> map=new HashMap<>();
        nodeAssit.ignoreNode(nodeid);
        return map;
    }
    @RequestMapping("/nodeReplace/replace/{originNodeid}/{desNodeid}")
    @ResponseBody
    public  Map<String,Object> replace(@PathVariable Long originNodeid,@PathVariable Long desNodeid) {
        Map<String,Object> map=new HashMap<>();
        nodeAssit.replaceNode(originNodeid,desNodeid);
        return map;
    }

}
