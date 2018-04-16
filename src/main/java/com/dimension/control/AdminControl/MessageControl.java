package com.dimension.control.AdminControl;

import com.dimension.dao.MessageMapper;
import com.dimension.pojo.Message;
import com.dimension.pojo.MessageConditon;
import com.dimension.pojo.User;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class MessageControl {
    @Resource
    private MessageMapper messageMapper;
    private static final int count = 10;
    //查看信息，并且回复信息，并设置信息为无效
    @RequestMapping("/message")
    public String message(Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");
        MessageConditon messageConditon = new MessageConditon();
        messageConditon.setDepartmentid(user.getDepartmentid());
        messageConditon.setCount(count);
        messageConditon.setStart(0);
        messageConditon.setState("0");
        List<Message> messages = messageMapper.selectMessage(messageConditon);
        int totalCount = messageMapper.count(messageConditon);
        int totalPage = (totalCount + count - 1) / count;
        JSONArray messagesJson = new JSONArray(messages);
        model.addAttribute("messages", messages);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("messagesJson", messagesJson);
        model.addAttribute("currentPage", 1);
        return "/admin/message";

    }

    @RequestMapping("/message/{start}")
    @ResponseBody
    public Map<String, Object> messageAjax(@PathVariable Integer start, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        start--;
        User user = (User) session.getAttribute("user");
        MessageConditon messageConditon = new MessageConditon();
        messageConditon.setDepartmentid(user.getDepartmentid());
        messageConditon.setCount(count);
        messageConditon.setStart(start);
        messageConditon.setState("0");
        List<Message> messages = messageMapper.selectMessage(messageConditon);
        if (messages.size() == 0&& start!=0) {
            start--;
            messageConditon.setStart(start);
            messages = messageMapper.selectMessage(messageConditon);
        }

        int totalCount = messageMapper.count(messageConditon);
        int totalPage = (totalCount + count - 1) / count;
        map.put("messages", messages);
        map.put("totalPage", totalPage);
        map.put("currentPage", start+1);
        return map;

    }

    @RequestMapping("updateMessage")
    @ResponseBody
    public Map<String, Object> updateMessage(Message message,HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        User user= (User) session.getAttribute("user");
        message.setReplytime(new Date());
        message.setAdminid(user.getId());
        message.setState("1");
        messageMapper.updateByPrimaryKeySelective(message);
        return map;
    }

}
