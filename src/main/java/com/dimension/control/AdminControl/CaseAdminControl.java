package com.dimension.control.AdminControl;

import com.dimension.dao.CaseMapper;
import com.dimension.dao.GroupMapper;
import com.dimension.dao.GroupUserMapper;
import com.dimension.pojo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONArray;
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
public class CaseAdminControl {

    @Resource
    private CaseMapper caseMapper;
    @Resource
    private GroupMapper groupMapper;
    @Resource
    private GroupUserMapper groupUserMapper;
    private static final int count = 1;



    @RequestMapping("/caseAdmin")
    public String caseAdmin(CaseCondition caseCondition, HttpSession session, Model model) throws JsonProcessingException {
        User user = (User) session.getAttribute("user");
        if (user.getRoleid()!=3)
        caseCondition.setDepartmentid(user.getDepartmentid());
        caseCondition.setRoleId(user.getRoleid());
        caseCondition.setUserId(user.getId());
        List<Case> cases = caseMapper.searchCases(caseCondition, 0, count);
        int totalCount = caseMapper.count(caseCondition);
        int totalPage = (totalCount + count - 1) / count;
        ObjectMapper mapper=new ObjectMapper();
        String casesJson=mapper.writeValueAsString(cases);
        model.addAttribute("cases", cases);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("casesJson", casesJson);
        model.addAttribute("currentPage", 1);
        return "/admin/caseAdmin";
    }


    @RequestMapping("/caseAdmin/{start}")
    @ResponseBody
    public Map<String, Object> caseAdminAjax(CaseCondition caseCondition, HttpSession session, @PathVariable int start) {
        start--;
        System.out.println(caseCondition);
        User user = (User) session.getAttribute("user");
        if (user.getRoleid()!=3)
        caseCondition.setDepartmentid(user.getDepartmentid());
        List<Case> cases = caseMapper.searchCases(caseCondition, start * count, count);
        if (cases.size() == 0 && start!=0){
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

    @RequestMapping("/addCase")
    @ResponseBody
    public Map<String, Object> addUser(Case case1, Group group, GroupUser groupUser, HttpSession session) {
        group.setDescription(null);
        Map<String, Object> map = new HashMap<>();
        //先创建组
        groupMapper.insertSelective(group);
        groupUser.setGroupid(group.getId());
        groupUser.setUserid(group.getGrouperid());
        case1.setGroupid(group.getId());
        User user = (User) session.getAttribute("user");
        case1.setDepartmentId(user.getDepartmentid());
        //插入案件和插入用户案件
        groupUserMapper.insertSelective(groupUser);
        caseMapper.insertSelective(case1);
        return map;
    }


}
