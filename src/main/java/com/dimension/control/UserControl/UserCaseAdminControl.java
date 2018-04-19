package com.dimension.control.UserControl;

import com.dimension.dao.CaseMapper;
import com.dimension.dao.GroupMapper;
import com.dimension.dao.GroupUserMapper;
import com.dimension.pojo.*;
import com.dimension.service.CaseAssist;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserCaseAdminControl {

    @Resource
    private CaseMapper caseMapper;
    @Resource
    private CaseAssist caseAssist;
    private static final int count = 10;


    @RequestMapping("/caseAdmin")
    public String caseAdmin(CaseCondition caseCondition, HttpSession session, Model model) throws JsonProcessingException {
        User user = (User) session.getAttribute("user");
        if (user.getRoleid() != 3)
            caseCondition.setDepartmentid(user.getDepartmentid());
        caseCondition.setRoleId(user.getRoleid());
        caseCondition.setUserId(user.getId());
        List<Case> cases = caseMapper.searchCases(caseCondition, 0, count);
        int totalCount = caseMapper.count(caseCondition);
        int totalPage = (totalCount + count - 1) / count;
        ObjectMapper mapper = new ObjectMapper();
        String casesJson = mapper.writeValueAsString(cases);
        model.addAttribute("cases", cases);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("casesJson", casesJson);
        model.addAttribute("currentPage", 1);
        return "/user/caseAdmin";
    }

    @RequestMapping("/caseAdmin/{start}")
    @ResponseBody
    public Map<String, Object> caseAdminAjax(CaseCondition caseCondition, HttpSession session, @PathVariable int start) {
        start--;
        User user = (User) session.getAttribute("user");
        caseCondition.setRoleId(user.getRoleid());
        caseCondition.setUserId(user.getId());
        if (user.getRoleid() != 3)
            caseCondition.setDepartmentid(user.getDepartmentid());
        List<Case> cases = caseMapper.searchCases(caseCondition, start * count, count);
        if (cases.size() == 0 && start != 0) {
            start--;
            cases = caseMapper.searchCases(caseCondition, start * count, count);
        }

        int totalCount = caseMapper.count(caseCondition);
        int totalPage = (totalCount + count - 1) / count;
        Map<String, Object> map = new HashMap<>();
        map.put("cases", cases);
        map.put("totalPage", totalPage);
        map.put("currentPage", start + 1);
        return map;
    }
    @RequestMapping("/deleteCase/{id}")
    @ResponseBody
    public Map<String, Object> deleteCase(@PathVariable int id) {
        Map<String, Object> map = new HashMap<>();
        caseMapper.deleteByPrimaryKey(id);
        return map;
    }
    @RequestMapping("/updateCase")
    @ResponseBody
    public Map<String, Object> updateCase(Case case1) {
        Map<String, Object> map = new HashMap<>();
        caseMapper.updateByPrimaryKeySelective(case1);
        map.put("case1", case1);
        return map;
    }

    @RequestMapping("/caseAdmin/compute")
    @ResponseBody
    public Map<String, Object> compute(String firstCase,String secondCase) throws IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("result",caseAssist.computeCompareCase(firstCase,secondCase));
        return map;
    }
}
