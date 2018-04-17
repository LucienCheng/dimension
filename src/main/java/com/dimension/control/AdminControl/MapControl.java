package com.dimension.control.AdminControl;

import com.dimension.dao.*;
import com.dimension.pojo.*;
import com.dimension.service.BaseNodeBuilder;
import com.dimension.service.NodeAssit;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class MapControl {
    @Resource
    private NodeAssit nodeAssit;
    @Resource
    private BaseNodeMapper baseNodeMapper;
    @Resource
    MarkNodeMapper markNodeMapper;
    @Resource
    BaseNodeBuilder baseNodeBuilder;
    @Resource
    private CaseMapper caseMapper;
    private static final int count = 10;

//提供给地图使用的点位搜索以及案件的查询，可以查询到自己管理的案件，以及他人案件，但是他人案件只有少量的信息。

    /**
     * @param caseCondition 这里包括了案件名称，案件时间，以及案件的类型
     * @param session
     * @param start         起始页面
     * @return
     */
    @RequestMapping("/nodeMap/case/{start}")
    @ResponseBody
    public Map<String, Object> caseMapAjax(CaseCondition caseCondition, HttpSession session, @PathVariable int start) {
        start--;
        System.out.println(caseCondition);
        User user = (User) session.getAttribute("user");
        caseCondition.setRoleId(user.getRoleid());
        if (user.getRoleid() != 3)
            caseCondition.setDepartmentid(user.getDepartmentid());
        List<Case> cases = caseMapper.searchMapCases(caseCondition, start * count, count);
        if (cases.size() == 0 && start != 0) {
            start--;
            cases = caseMapper.searchMapCases(caseCondition, start * count, count);
        }

        int totalCount = caseMapper.mapCount(caseCondition);
        int totalPage = (totalCount + count - 1) / count;
        Map<String, Object> map = new HashMap<>();
        map.put("cases", cases);
        map.put("totalPage", totalPage);
        map.put("currentPage", start + 1);
        return map;
    }

    //获取具体的案件相关点位的信息
    @RequestMapping("/nodeMap/case/caseid/{caseid}")
    @ResponseBody
    public Map<String, Object> showCaseNode(@PathVariable int caseid) {
        List<BaseNode> baseNodes = new ArrayList<>();
        List<Long> nodeIds = caseMapper.searchCaseNodeBycaseId(caseid);
        for (Long nodeid : nodeIds) {
            baseNodeBuilder.setNodeId(nodeid);
            baseNodeBuilder.buildFile();
            baseNodes.add(baseNodeBuilder.getResult());
        }
        Map<String, Object> map = new HashMap<>();
        map.put("baseNodes", baseNodes);
        map.put("caseid",caseid);
        return map;
    }

    @RequestMapping("/nodeMap/node/{start}")
    @ResponseBody
    public Map<String, Object> nodeAjax(BaseNodeConditon baseNodeConditon, HttpSession session, @PathVariable int start) {
        Map<String, Object> map = new HashMap<>();
        User user = (User) session.getAttribute("user");
        //标记点
        if (3 == baseNodeConditon.getNodetype()) {
            start--;
            List<BaseNode> baseNodes = markNodeMapper.searchMarkNode(baseNodeConditon, user.getId(), start * count, count);

            if (baseNodes.size() == 0 && start != 0) {
                start--;
                baseNodes = markNodeMapper.searchMarkNode(baseNodeConditon, user.getId(), start * count, count);
            }
            for (BaseNode baseNode : baseNodes) {
                baseNodeBuilder.setNodeId(baseNode.getNodeid());
                baseNodeBuilder.buildFile();
                baseNode.setFiles(baseNodeBuilder.getResult().getFiles());
            }
            int totalCount = markNodeMapper.count(baseNodeConditon, user.getId());
            int totalPage = (totalCount + count - 1) / count;
            map.put("baseNodes", baseNodes);
            map.put("totalPage", totalPage);
            map.put("currentPage", start + 1);
        } else {
            start--;
            //设置用户的角色
            baseNodeConditon.setRoleId(user.getRoleid());
            //设置部门的id
            baseNodeConditon.setDpId(user.getDepartmentid());
            baseNodeConditon.setUserId(user.getId());
            baseNodeConditon.setDpIds(user.getSubDepartment());
            List<BaseNode> baseNodes = nodeAssit.searchSimpleNode(baseNodeConditon, start * count, count);

            if (baseNodes.size() == 0 && start != 0) {
                start--;
                baseNodes = nodeAssit.searchSimpleNode(baseNodeConditon, start * count, count);
            }
            for (BaseNode baseNode : baseNodes) {
                baseNodeBuilder.setNodeId(baseNode.getNodeid());
                baseNodeBuilder.buildFile();
                baseNode.setFiles(baseNodeBuilder.getResult().getFiles());
            }
            int totalCount = baseNodeMapper.count(baseNodeConditon);
            int totalPage = (totalCount + count - 1) / count;

            map.put("baseNodes", baseNodes);
            map.put("totalPage", totalPage);
            map.put("currentPage", start + 1);

        }
        return map;
    }
}
