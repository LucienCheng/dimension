package com.dimension.serviceImpl;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.naming.java.javaURLContextFactory;
import org.springframework.web.multipart.MultipartFile;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.dao.BasestationMapper;
import com.dimension.dao.CaseNodeMapper;
import com.dimension.dao.FileMapper;
import com.dimension.dao.MarkNodeMapper;
import com.dimension.dao.WifiMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;
import com.dimension.pojo.Basestation;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseCondition;
import com.dimension.pojo.CaseNode;
import com.dimension.pojo.Field;
import com.dimension.pojo.File;
import com.dimension.pojo.MarkNode;
import com.dimension.pojo.Wifi;
import com.dimension.service.CompareNodeService;
import com.dimension.service.NodeAssit;
import com.dimension.service.NodeComplex;
import com.dimension.service.TableFieldService;

public class NodeAssitImpl implements NodeAssit {
	private final static String filePathPrefix = "/file/";
	private CompareNodeService compareNodeService = new CompareNodeImpl();
	@Resource
	private BaseNodeMapper baseNodeMapper;
	@Resource
	private FileMapper fileMapper;
	@Resource
	private TableFieldService tableFieldService;
	@Resource
	private WifiMapper wifiMapper;
	@Resource
	private BasestationMapper basestationMapper;
	@Resource
	private CaseNodeMapper caseNodeMapper;
	@Resource
	private MarkNodeMapper markNodeMapper;
	@Resource
	private NodeComplex nodeComplex;

	@Override
	public boolean setBaseNode(BaseNode baseNode) {
		// 设置基本点基本信息。
		// 如果客户端是设置点位其他的信息，就会调用各自的ajax进行操作，添加或者删除，或者修改。
		baseNodeMapper.updateByPrimaryKeySelective(baseNode);
		return true;
	}

	@Override
	public boolean setCaseNode(CaseNode caseNode) {
		caseNodeMapper.updateByPrimaryKeySelective(caseNode);
		setBaseNode(caseNode.getBaseNode());
		return true;
	}

	@Override
	public boolean markNode(MarkNode markNode, boolean judge) {
		if (judge) {
			markNodeMapper.insert(markNode);
		} else {
			markNodeMapper.deleteByPrimaryKey(markNode.getMarkid());
		}
		return true;
	}

	@Override
	public BigDecimal compareNode(Long nodeIdFirst, Long nodeIdSecond) {
		return compareNodeService.compareNode(nodeIdFirst, nodeIdSecond);
	}

	@Override
	public boolean upgradeNode(CaseNode caseNode) {
		// 插入案件信息
		caseNodeMapper.insert(caseNode);
		// 复制基础点位信息，并且添加案件的信息
		BaseNode baseNode = nodeComplex.constructBaseNode(caseNode.getBaseNode().getNodeid());
		baseNodeMapper.insert(baseNode);
		// 插入文件
		for (File file : baseNode.getFiles()) {
			file.setNodeid(baseNode.getNodeid());
			fileMapper.insert(file);
		}
		// 插入wifi
		for (Wifi wifi : baseNode.getWifis()) {
			wifi.setNodeid(baseNode.getNodeid());
			wifiMapper.insert(wifi);
		}
		// 插入basestation
		for (Basestation basestation : baseNode.getBasestations()) {
			basestation.setNodeid(baseNode.getNodeid());
			basestationMapper.insert(basestation);
		}
		// 插入具体表的值
		List<Field> fields = baseNode.getOther();
		Map<String, Object> map = new HashMap<String, Object>();
		for (Field field : fields) {
			map.put(field.getEnglishname(), field.getValue());
		}
		map.put("nodeId", baseNode.getNodeid());
		tableFieldService.insertRecord(baseNode.getTable().getEnglishname(), map);
		return true;
	}

	@Override
	public boolean degradeNode(BaseNode baseNode) {
		// 复制案件点位的BaseNode的信息，并且设置案件点无效
		baseNode.setIsvalid("0");
		baseNodeMapper.updateByPrimaryKeySelective(baseNode);
		baseNode.setIsvalid("1");
		baseNodeMapper.insert(baseNode);

		// 插入文件
		for (File file : baseNode.getFiles()) {
			file.setNodeid(baseNode.getNodeid());
			fileMapper.insert(file);
		}
		// 插入wifi
		for (Wifi wifi : baseNode.getWifis()) {
			wifi.setNodeid(baseNode.getNodeid());
			wifiMapper.insert(wifi);
		}
		// 插入basestation
		for (Basestation basestation : baseNode.getBasestations()) {
			basestation.setNodeid(baseNode.getNodeid());
			basestationMapper.insert(basestation);
		}
		// 插入具体表的值
		List<Field> fields = baseNode.getOther();
		Map<String, Object> map = new HashMap<String, Object>();
		for (Field field : fields) {
			map.put(field.getEnglishname(), field.getValue());
		}
		map.put("nodeId", baseNode.getNodeid());
		tableFieldService.insertRecord(baseNode.getTable().getEnglishname(), map);
		return true;
	}

	@Override
	public BaseNode getBaseNode(Long nodeId) {

		return nodeComplex.constructBaseNode(nodeId);
	}

	@Override
	public CaseNode getCaseNode(Long nodeId) {

		return nodeComplex.constructCaseNode(nodeId);
	}

	@Override
	public boolean setCase(CaseNode caseNode) {
		caseNodeMapper.updateByPrimaryKeySelective(caseNode);
		return true;
	}

	@Override
	public boolean addFile(File file,HttpServletRequest request,MultipartFile multipartFile) {
		//设置文件名
		Date date=new Date();
		String fileName=multipartFile.getOriginalFilename();
		file.setUpdatetime(date);
		fileName=date.getTime()+"_"+fileName;
		
		//将传送到指定的位置
		String contentPathString=request.getServletContext().getRealPath("/");
		java.io.File dir=new java.io.File(contentPathString);
		//如果文件夹不存在，创建
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			multipartFile.transferTo(new java.io.File(contentPathString,filePathPrefix+fileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//首先添加到本地目录下,客户端需要对文件进行一次判断，确认文件的类型
		file.setFileaddress(request.getContextPath()+filePathPrefix+fileName);
		
		//这里添加文件记录到数据库
		fileMapper.insertSelective(file);
		return true;
	}

	@Override
	public boolean deleteFile(File file, HttpServletRequest request) {
		// 删除文件，包括删除本地的文件
		//删除数据库的记录
		fileMapper.deleteByPrimaryKey(file.getId());
		String fileAddress = file.getFileaddress();
		fileAddress = fileAddress.substring(0, 10);
		String contentPathString = request.getServletContext().getRealPath("/");
		java.io.File file2 = new java.io.File(contentPathString, fileAddress);
		//删除本地文件
		file2.delete();
		return true;
	}

	@Override
	public boolean setFields(BaseNode baseNode) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (Field field : baseNode.getOther()) {
			map.put(field.getEnglishname(), field.getValue());
		}
		map.put("nodeId", baseNode.getNodeid());
		tableFieldService.setField(baseNode.getTable().getEnglishname(), map);
		return true;
	}

	@Override
	public boolean dropRecord(BaseNode baseNode) {
		tableFieldService.dropRecord(baseNode.getTable().getEnglishname(), baseNode.getNodeid());
		return true;
	}
	
	// 获取的是简单点位的信息。
	@Override
	public List<BaseNode> searchSimpleNode(BaseNodeConditon baseNodeConditon) {
		// 包括案件点，基础点
		List<BaseNode> baseNodes =baseNodeMapper.selectEdited(baseNodeConditon);
		if (baseNodeConditon.getRoleId()!=3) {
			//添加不可编辑的店
			baseNodes.addAll(baseNodeMapper.selectUnEdited(baseNodeConditon));
		}
		return baseNodes;
	}
	
	//搜索标记点
	@Override
	public List<BaseNode> searchMarkNode(Integer userId) {
		// TODO Auto-generated method stub
		return markNodeMapper.searchMarkNode(userId);
	}
	
	// 搜索案件，并且展示案件点。
	@Override
	public List<Case> searchCase(CaseCondition caseCondition) {
		// 搜索案件，案件里包括了案件点
		List<Case> cases = new ArrayList<Case>();
		return cases;
	}

	
}
