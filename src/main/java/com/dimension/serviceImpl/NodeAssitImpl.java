package com.dimension.serviceImpl;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
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
@Service
public class NodeAssitImpl implements NodeAssit {
	private final static String imagePathPrefix = "/file/image/";
	private final static String videoPathPrefix = "/file/video/";
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
			markNodeMapper.insertSelective(markNode);
		} else {
			markNodeMapper.deleteByPrimaryKey(markNode.getMarkid());
		}
		return true;
	}

	@Override
	public BigDecimal compareNode(Long nodeIdFirst, Long nodeIdSecond) {
		return compareNodeService.compareNode(nodeIdFirst, nodeIdSecond);
	}

	//这个是需要在casenode中设置一下从哪升级过来的，设置一下baseNodeid,默认来说，是不复制文件的
	@Override
	public boolean upgradeNode(CaseNode caseNode) {
		// 插入案件信息
		caseNodeMapper.insertSelective(caseNode);
		// 复制基础点位信息，并且添加案件的信息
		BaseNode baseNode = nodeComplex.constructBaseNode(caseNode.getBaseNode().getNodeid());
		baseNodeMapper.insertSelective(baseNode);
		// 插入wifi
		for (Wifi wifi : baseNode.getWifis()) {
			wifi.setNodeid(baseNode.getNodeid());
			wifiMapper.insertSelective(wifi);
		}
		// 插入basestation
		for (Basestation basestation : baseNode.getBasestations()) {
			basestation.setNodeid(baseNode.getNodeid());
			basestationMapper.insertSelective(basestation);
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
//不对文件处理，并且将基础点的信息和降级后，和基础信息相关的信息进行一个比较，提供给点位拥有着进行比较的方便
	@Override
	public boolean degradeNode(BaseNode baseNode) {
		
		//首先先看一下caseNode中的baseNodeId,如果为空，那就直接删除案件信息。
		CaseNode caseNode=caseNodeMapper.getCaseNodeByNodeId(baseNode.getNodeid());
		if (caseNode.getBaseNodeId()==null) {
			//直接删除,然后这个基础点位就是归属一个这个用户了
			caseNodeMapper.deleteByPrimaryKey(caseNode.getId());
			baseNode.setNodetype("1");
			baseNodeMapper.updateByPrimaryKeySelective(baseNode);
		}
		else {
			caseNodeMapper.deleteByPrimaryKey(caseNode.getId());
			// 复制案件点位的BaseNode的信息，并且设置案件点无效
			baseNode.setIsvalid("0");
			baseNodeMapper.updateByPrimaryKeySelective(baseNode);
			baseNode.setIsvalid("1");
			baseNode.setNodetype("2");//案件点
			baseNodeMapper.insertSelective(baseNode);
			// 插入wifi
			for (Wifi wifi : baseNode.getWifis()) {
				wifi.setNodeid(baseNode.getNodeid());
				wifiMapper.insertSelective(wifi);
			}
			// 插入basestation
			for (Basestation basestation : baseNode.getBasestations()) {
				basestation.setNodeid(baseNode.getNodeid());
				basestationMapper.insertSelective(basestation);
			}
			// 插入具体表的值
			List<Field> fields = baseNode.getOther();
			Map<String, Object> map = new HashMap<String, Object>();
			for (Field field : fields) {
				map.put(field.getEnglishname(), field.getValue());
			}
			map.put("nodeId", baseNode.getNodeid());
			tableFieldService.insertRecord(baseNode.getTable().getEnglishname(), map);
			
		}
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
	public boolean addFile(File file,HttpServletRequest request,MultipartFile multipartFile) throws IOException {
		//设置文件名
		Date date=new Date();
		String fileName=multipartFile.getOriginalFilename();
		file.setUpdatetime(date);
		fileName=date.getTime()+"_"+fileName;
		
		//将传送到指定的位置
		String contentPathString=request.getServletContext().getRealPath("/");
		java.io.File dir=null;
		if(file.getFiletype().equals("视频")){
			dir=new java.io.File(contentPathString+videoPathPrefix);
			fileName=videoPathPrefix+fileName;
		}

		else{
			dir=new java.io.File(contentPathString+imagePathPrefix);
			fileName=imagePathPrefix+fileName;
		}

		//如果文件夹不存在，创建
		if (!dir.exists()) {
			dir.mkdirs();
		}
		multipartFile.transferTo(new java.io.File(contentPathString,fileName));

		//首先添加到本地目录下,客户端需要对文件进行一次判断，确认文件的类型
		file.setFileaddress(request.getContextPath()+fileName);
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
		int index=fileAddress.indexOf("/file");
		fileAddress = fileAddress.substring(index);
		String contentPathString = request.getServletContext().getRealPath("/");
		java.io.File file2 = new java.io.File(contentPathString, fileAddress);
		//删除本地文件
		file2.delete();
		return true;
	}



	@Override
	public boolean dropRecord(BaseNode baseNode) {
		//设置为无效
		baseNode.setIsvalid("0");
		baseNodeMapper.updateByPrimaryKeySelective(baseNode);
		return true;
	}
	
	// 获取的是简单点位的信息。这这里需要处理一下相同坐标的点位，会在客户端有个提示，表示这是同一个坐标的点位信息
	@Override
	public List<BaseNode> searchSimpleNode(BaseNodeConditon baseNodeConditon,Integer start,Integer count) {
		// 包括案件点，基础点
		baseNodeConditon.setStart(start);
		baseNodeConditon.setCount(count);
		List<BaseNode> baseNodes =baseNodeMapper.selectBaseNode(baseNodeConditon);
		return baseNodes;
	}
	
	//搜索标记点
	@Override
	public List<BaseNode> searchMarkNode(Integer userId,Integer start,Integer count) {
		// TODO Auto-generated method stub
		return markNodeMapper.searchMarkNode(userId,start,count);
	}
	
	// 搜索案件，并且展示案件点。
	@Override
	public List<Case> searchCase(CaseCondition caseCondition) {
		// 搜索案件，案件里包括了案件点
		List<Case> cases = new ArrayList<Case>();
		return cases;
	}

	
}
