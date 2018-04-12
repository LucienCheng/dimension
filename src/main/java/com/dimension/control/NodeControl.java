package com.dimension.control;

import com.dimension.dao.TableMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.CaseNode;
import com.dimension.pojo.Table;
import com.dimension.service.NodeAssit;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class NodeControl {
    @Resource
    NodeAssit nodeAssit;
    @Resource
    TableMapper tableMapper;

    //检索具体点位的信息
    @RequestMapping("/node/{nodeid}")
    public String node(@PathVariable Long nodeid, String nodetype, Model model) throws JsonProcessingException {

        Table table = new Table();
        List<Table> tables = tableMapper.selectByCondition(table, null, null);
        if ("1".equals(nodetype)) {
            BaseNode baseNode = nodeAssit.getBaseNode(nodeid);
            baseNode.setTables(tables);
            model.addAttribute("baseNode", baseNode);

        } else {
            CaseNode caseNode = nodeAssit.getCaseNode(nodeid);
            caseNode.getBaseNode().setTables(tables);
            model.addAttribute("caseNode", caseNode);
            model.addAttribute("baseNode", caseNode.getBaseNode());
        }
        model.addAttribute("nodetype", nodetype);
        return "/node";
    }
}
