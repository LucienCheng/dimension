	package com.dimension.service;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseCondition;
import com.dimension.pojo.CaseNode;
import com.dimension.pojo.File;
import com.dimension.pojo.MarkNode;
/**
 * 
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
	boolean addFile(File file,HttpServletRequest request,MultipartFile multipartFile);
	//删除文件
	boolean deleteFile(File file,HttpServletRequest request);
	//设置特殊点位的值
	boolean setFields(BaseNode baseNode);
	//删除某条记录
	boolean dropRecord(BaseNode baseNode);
	
	boolean setCase(CaseNode caseNode);

	boolean setBaseNode(BaseNode baseNode);
	
	boolean setCaseNode(CaseNode caseNode);

	boolean upgradeNode(CaseNode caseNode);

	boolean degradeNode(BaseNode baseNode);
	
	//true表示标记，false表示取消标记
	boolean markNode(MarkNode markNode,boolean judge);
	
	//比较点位的相似程度
	BigDecimal compareNode(Long nodeIdFirst, Long nodeIdSecond);
	
	//提供给检索点位时使用，点的类型包括了案件点，基础点，标记点。
	List<BaseNode> searchSimpleNode(BaseNodeConditon baseNodeConditon);
	
	//查看自己标记的点位。
	List<BaseNode> searchMarkNode(Integer userId);
	
	//提供搜索案件点位的检索。通过搜索案件，可以获得案件点位信息。
	List<Case> searchCase(CaseCondition caseCondition);
 
}
