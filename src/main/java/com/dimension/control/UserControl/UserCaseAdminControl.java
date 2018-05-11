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
import java.util.ArrayList;
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
    @Resource
    private GroupUserMapper groupUserMapper;
    private static final int count = 10;


    @RequestMapping("/caseAdmin")
    public String caseAdmin(CaseCondition caseCondition, HttpSession session, Model model) throws JsonProcessingException {
        User user = (User) session.getAttribute("user");
        if (user.getRoleid() != 3)
            caseCondition.setDepartmentid(user.getDepartmentid());
        caseCondition.setIsGrouper(1);
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
        caseCondition.setIsGrouper(1);
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
    public Map<String, Object> compute(String firstCaseid, String secondCaseid) throws IOException, ClassNotFoundException {
        Map<String, Object> map = new HashMap<>();
        map.put("result", caseAssist.computeCompareCase(firstCaseid, secondCaseid));
        return map;
    }
    @RequestMapping("/caseAdmin/getGrouperByCaseId/{caseId}")
    @ResponseBody
    public Map<String, Object> getGrouperByCaseId(@PathVariable Integer caseId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<>();
        List<GroupUser> groupers=groupUserMapper.getGrouperByCaseId(caseId);
        GroupUser groupuser=new GroupUser();
        groupuser.setUserid(user.getId());
        List<GroupUser> selectUsers=groupUserMapper.getUserByDepartId(user.getDepartmentid());
        selectUsers.removeAll(groupers);
        selectUsers.remove(groupuser);
        map.put("groupers", groupers);
        map.put("selectUsers", selectUsers);
        return map;
    }
    @RequestMapping("/caseAdmin/deleteUser/{grouperUserid}")
    @ResponseBody
    public Map<String, Object> deleteUser(@PathVariable Integer grouperUserid) {
        Map<String, Object> map = new HashMap<>();
        groupUserMapper.deleteByPrimaryKey(grouperUserid);
        return map;
    }
    @RequestMapping("/caseAdmin/addUser")
    @ResponseBody
    public Map<String, Object> addUser(GroupUser groupUser) {
        Map<String, Object> map = new HashMap<>();
        groupUserMapper.insertSelective(groupUser);
        map.put("grouper",groupUser);
        return map;
    }
}
