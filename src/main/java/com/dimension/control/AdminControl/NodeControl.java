package com.dimension.control.AdminControl;

import com.dimension.dao.*;
import com.dimension.pojo.*;
import com.dimension.service.NodeAssit;
import com.dimension.service.TableFieldService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

@RequestMapping("/admin")
public class NodeControl {
    @Resource
    NodeAssit nodeAssit;
    @Resource
    TableMapper tableMapper;
    @Resource
    CaseMapper caseMapper;
    @Resource
    MarkNodeMapper markNodeMapper;
    @Resource
    UserMapper userMapper;
    @Resource
    TableFieldService tableFieldService;
    @Resource
    CaseNodeMapper caseNodeMapper;

    //检索具体点位的信息
    @RequestMapping("/node/{nodeid}")
    public String node(@PathVariable Long nodeid, String nodetype, Model model, HttpSession session) throws JsonProcessingException {
        User user = (User) session.getAttribute("user");
        Table table = new Table();
        List<Table> tables = tableMapper.selectByCondition(table, null, null);
        CaseCondition caseCondition = new CaseCondition();
        caseCondition.setRoleId(user.getRoleid());
        caseCondition.setUserId(user.getId());
        caseCondition.setDepartmentid(user.getDepartmentid());
        ObjectMapper objectMapper = new ObjectMapper();
        BaseNode baseNode = null;
        if ("1".equals(nodetype)) {
            baseNode = nodeAssit.getBaseNode(nodeid);
            baseNode.setTables(tables);
            model.addAttribute("baseNode", baseNode);
        } else if("2".equals(nodetype)){
            CaseNode caseNode = nodeAssit.getCaseNode(nodeid);


            caseNode.getBaseNode().setTables(tables);
            model.addAttribute("casesJson", objectMapper.writeValueAsString(caseMapper.searchCases(caseCondition, null, null)));
            model.addAttribute("caseNode", caseNode);
            baseNode = caseNode.getBaseNode();
            model.addAttribute("baseNode", baseNode);
        }
        String othersJson=objectMapper.writeValueAsString(baseNode.getOther());
        MarkNode markNode=new MarkNode();
        markNode.setUserid(user.getId());
        markNode.setNodeid(baseNode.getNodeid());
        Integer markId = markNodeMapper.selectByNodeIdUser(markNode);
        int roleid = user.getRoleid();
        int isEdited = 0;
       if (roleid == 4) {
            //只能编辑自己部门的
            User nodeUser = userMapper.selectByPrimaryKey(baseNode.getUserid());
            if (nodeUser.getDepartmentid() == user.getDepartmentid()) {
                isEdited = 1;
            }
            System.out.println("部门管理员");
        } else {
            isEdited = 1;
            System.out.println("超级");
        }
        model.addAttribute("othersJson", othersJson);
        model.addAttribute("cases", caseMapper.searchCases(caseCondition, null, null));
        model.addAttribute("nodetype", nodetype);
        model.addAttribute("isEdited", isEdited);
        model.addAttribute("markId", markId);
        return "admin/node";
    }

    @RequestMapping("/node/upgradeNode")
    @ResponseBody
    public Map<String, Object> upgradeNode(CaseNode caseNode,HttpSession session)  {
        User user=(User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<>();
        nodeAssit.upgradeNode(caseNode,user);
        map.put("nodeid",caseNode.getNodeid());
        return map;
    }
    @RequestMapping("/node/degradeNode/{nodeid}")
    @ResponseBody
    public Map<String, Object> degradeNode( @PathVariable Long nodeid,HttpSession session)  {
        User user=(User) session.getAttribute("user");
        BaseNode baseNode=new BaseNode();
        baseNode.setNodeid(nodeid);
        baseNode.setUserid(user.getId());
        Map<String, Object> map = new HashMap<>();
        nodeAssit.degradeNode(baseNode);
        map.put("nodeid",baseNode.getNodeid());
        return map;
    }
    @RequestMapping("/node/modifyField")

    @ResponseBody
    public Map<String, Object> modifyField(String fields, String baseNodeData) throws IOException {
        Map<String, Object> map = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        //动态表的名称
        List<FieldCondition> fieldsArray = mapper.readValue(fields, new TypeReference<List<FieldCondition>>() {
        });
        //base_node表里的基础信息
        BaseNode baseNode = mapper.readValue(baseNodeData, BaseNode.class);
        System.out.println(baseNode);
        nodeAssit.setBaseNode(baseNode);
        if (!fieldsArray.isEmpty()){
            Map<String, Object> map1 = new HashMap<String, Object>();
            for (FieldCondition field:fieldsArray) {
                map1.put(field.getEnglishname(),field.getValue());
            }
            map1.put("nodeid", baseNode.getNodeid());
            tableFieldService.setField(fieldsArray.get(0).getTablename(), map1);
        }
        return map;
    }
    @RequestMapping("/node/modifyCaseNode")
    @ResponseBody
    public Map<String, Object> modifyCaseNode(CaseNode caseNode)  {
        Map<String, Object> map = new HashMap<>();
        caseNodeMapper.updateByPrimaryKeySelective(caseNode);
        return map;
    }
    @RequestMapping("/node/mark/{nodeid}/{isMark}")
    @ResponseBody
    public Map<String, Object> mark(@PathVariable Long nodeid,@PathVariable int isMark,Long markId,HttpSession session)  {
        Map<String, Object> map = new HashMap<>();
        User user=(User)session.getAttribute("user");
        MarkNode markNode=new MarkNode();
        markNode.setNodeid(nodeid);
        markNode.setUserid(user.getId());
        //进行标记
        if(isMark==1){
        markNodeMapper.insertSelective(markNode);
        map.put("markId",markNode.getMarkid());
        }else {
        markNodeMapper.deleteByPrimaryKey(markId);
        map.put("markId",-1);
        }
        return map;
    }
    @RequestMapping("/node/uploadMultipleFile/{nodeid}")
    @ResponseBody
    public Map<String, Object> uploadMultipleFile(@RequestParam("files") MultipartFile[] files, HttpServletRequest request,@PathVariable Long nodeid) throws Exception {
        Map<String, Object> map = new HashMap<>();
        for (MultipartFile file : files) {
            String fileName=file.getOriginalFilename();
            //如果是视频
            if(isVideo(fileName)){
                File file1=new File();
                file1.setNodeid(nodeid);
                file1.setFiletype("视频");
                file1.setFilename(fileName);
                nodeAssit.addFile(file1,request,file);
            }
            //如果是照片
            else if(isImage(fileName)){
                File file1=new File();
                file1.setNodeid(nodeid);
                file1.setFiletype("照片");
                file1.setFilename(fileName);
                nodeAssit.addFile(file1,request,file);
            }
        }
        map.put("statue", "success");
        return map;
    }
    @RequestMapping("/node/deleteFile/{fileId}")
    @ResponseBody
    public Map<String, Object> deleteFile(@PathVariable Integer fileId,String fileAddress,HttpServletRequest request) throws IOException {
        Map<String, Object> map = new HashMap<>();
        File file=new File();
        file.setId(fileId);
        file.setFileaddress(fileAddress);
        nodeAssit.deleteFile(file,request);
        return map;
    }
    @RequestMapping(value="/node/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request,@RequestParam("filename") String filename)throws Exception {

        String contentPathString=request.getServletContext().getRealPath("/");
        java.io.File file = new java.io.File(contentPathString+filename);
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", downloadFielName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
   private boolean isImage(String fileName) {
        if(fileName.indexOf(".jpg")!=-1||fileName.indexOf(".gif")!=-1||fileName.indexOf(".png")!=-1)
        {
            return true;
        }
        return false;
    }
    private boolean isVideo(String fileName) {
        if(fileName.indexOf(".mp4")!=-1||fileName.indexOf(".avi")!=-1)
        {
            return true;
        }
        return false;
    }
}
