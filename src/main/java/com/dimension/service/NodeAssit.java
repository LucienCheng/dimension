package com.dimension.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dimension.pojo.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author chengliao
 * @date 2018年3月8日
 * @Description:点位操作的助手，包括点位的查找，获取，删除，修改操作。
 */
public interface NodeAssit {
    //通过id获取一个完整的基础点位信息
    BaseNode getBaseNode(Long nodeId);

    //通过id获取一个完整的案件点位信息
    CaseNode getCaseNode(Long nodeId);

    //将文件添加
    boolean addFile(File file, HttpServletRequest request, MultipartFile multipartFile) throws IOException;

    //删除文件
    boolean deleteFile(File file, HttpServletRequest request);

    //删除某条记录
    boolean dropRecord(BaseNode baseNode);

    boolean setCase(CaseNode caseNode);

    boolean setBaseNode(BaseNode baseNode);

    boolean setCaseNode(CaseNode caseNode);

    boolean upgradeNode(CaseNode caseNode, User user);

    boolean degradeNode(BaseNode baseNode);

    //true表示标记，false表示取消标记
    boolean markNode(MarkNode markNode, boolean judge);


    //提供给检索点位时使用，点的类型包括了案件点，基础点，标记点。
    List<BaseNode> searchSimpleNode(BaseNodeConditon baseNodeConditon, Integer start, Integer count);

    //获取这个用户中需要替换的点
    List<BaseNode> getRepalceNode(User user);

    //获取某个点能够替换的点
    List<BaseNode> getNeedReplacedNode(Long nodeid);

    //忽略这个点的替换
    boolean ignoreNode(Long nodeid);

    //使用这个点来替换点位
    boolean replaceNode(Long originNodeId,Long desNodeId);

    //提供搜索案件点位的检索。通过搜索案件，可以获得案件点位信息。
    List<Case> searchCase(CaseCondition caseCondition);


}
