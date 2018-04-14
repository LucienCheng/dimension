package com.dimension.control;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;
import com.dimension.pojo.CaseCondition;
import com.dimension.pojo.User;
import com.dimension.service.NodeAssit;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class NodeSearch {
    @Resource
    private NodeAssit nodeAssit;
    @Resource
    private BaseNodeMapper baseNodeMapper;
    private static int count = 1;

    @RequestMapping("/nodeText")
    public String nodeText(HttpSession session, Model model, BaseNodeConditon baseNodeConditon) throws JsonProcessingException {
        User user = (User) session.getAttribute("user");
        //设置用户的角色
        baseNodeConditon.setRoleId(user.getRoleid());
        //设置部门的id
        baseNodeConditon.setDpId(user.getDepartmentid());
        baseNodeConditon.setUserId(user.getId());
        baseNodeConditon.setDpIds(user.getSubDepartment());
        baseNodeConditon.setNodetype(1);
        List<BaseNode> baseNodes = nodeAssit.searchSimpleNode(baseNodeConditon, 0, count);

        int totalCount = baseNodeMapper.count(baseNodeConditon);
        int totalPage = (totalCount + count - 1) / count;
        ObjectMapper mapper = new ObjectMapper();
        String baseNodesJson=mapper.writeValueAsString(baseNodes);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("baseNodesJson", baseNodesJson);
        model.addAttribute("currentPage", 1);
        return "/admin/nodeText";
    }

    @RequestMapping("/nodeText/{start}")
    @ResponseBody
    public Map<String, Object> caseAdminAjax(BaseNodeConditon baseNodeConditon, HttpSession session, @PathVariable int start) {
        start--;
        User user = (User) session.getAttribute("user");

        //设置用户的角色
        baseNodeConditon.setRoleId(user.getRoleid());
        //设置部门的id
        baseNodeConditon.setDpId(user.getDepartmentid());
        baseNodeConditon.setUserId(user.getId());
        baseNodeConditon.setDpIds(user.getSubDepartment());
        List<BaseNode> baseNodes = nodeAssit.searchSimpleNode(baseNodeConditon, start*count, count);
        if (baseNodes.size() == 0&&start!=0) {
            start--;
            baseNodes = nodeAssit.searchSimpleNode(baseNodeConditon, start*count, count);
        }

        int totalCount = baseNodeMapper.count(baseNodeConditon);
        int totalPage = (totalCount + count - 1) / count;
        Map<String, Object> map = new HashMap<>();
        map.put("baseNodes", baseNodes);
        map.put("totalPage", totalPage);
        map.put("currentPage", start + 1);
        return map;
    }

}