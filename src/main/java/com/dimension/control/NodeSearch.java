package com.dimension.control;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;
import com.dimension.pojo.User;
import com.dimension.service.NodeAssit;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class NodeSearch {
    @Resource
    private NodeAssit nodeAssit;
    @Resource
    private BaseNodeMapper baseNodeMapper;
    private static int count = 1;

    @RequestMapping("/nodeText")
    public String nodeText(HttpSession session, Model model, BaseNodeConditon baseNodeConditon) {
        User user = (User) session.getAttribute("user");
        //设置用户的角色
        baseNodeConditon.setRoleId(user.getRoleid());
        //设置部门的id
        baseNodeConditon.setDpId(user.getDepartmentid());
        baseNodeConditon.setUserId(user.getId());
        baseNodeConditon.setDpIds(user.getSubDepartment());
        List<BaseNode> baseNodes = nodeAssit.searchSimpleNode(baseNodeConditon, 0, count);
        System.out.println(baseNodes.get(0));
        int totalCount = baseNodeMapper.count(baseNodeConditon);
        int totalPage = (totalCount + count - 1) / count;
        JSONArray baseNodesJson = new JSONArray(baseNodes);
        model.addAttribute("baseNodes", baseNodes);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("baseNodesJson", baseNodesJson);
        model.addAttribute("currentPage", 1);
        return "/admin/nodeText";
    }
}
