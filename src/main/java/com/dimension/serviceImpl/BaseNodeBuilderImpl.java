package com.dimension.serviceImpl;

import java.util.List;

import javax.annotation.Resource;


import com.dimension.dao.BaseNodeMapper;
import com.dimension.dao.BasestationMapper;
import com.dimension.dao.FileMapper;
import com.dimension.dao.WifiMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Basestation;
import com.dimension.pojo.File;
import com.dimension.pojo.Wifi;

public class BaseNodeBuilderImpl implements com.dimension.service.BaseNodeBuilder {
	@Resource
	private WifiMapper wifiMapper;
	@Resource
	private FileMapper fileMapper;
	@Resource 
	private BasestationMapper basestationMapper;
	@Resource
	private BaseNodeMapper baseNodeMapper;

	private Long nodeId;
	
	public BaseNodeBuilderImpl(Long nodeId) {
		this.setNodeId(nodeId);
	}
	@Override
	public List<Wifi> buildWifi(Long nodeId) {
		// TODO Auto-generated method stub
		return wifiMapper.getWifiByNodeId(nodeId);
	}

	@Override
	public List<File> buildFile(Long nodeId) {
		// TODO Auto-generated method stub
		return fileMapper.getFileByNodeId(nodeId);
	}

	@Override
	public List<Basestation> buildBasestation(Long nodeId) {
		// TODO Auto-generated method stub
		return basestationMapper.getBasestationByNodeId(nodeId);
	}

	@Override
	public BaseNode getResult() {
		BaseNode baseNode=baseNodeMapper.selectByPrimaryKey(nodeId);
		baseNode.setFiles(buildFile(nodeId));
		baseNode.setWifis(buildWifi(nodeId));
		baseNode.setBasestations(buildBasestation(nodeId));
		return baseNode;
	}
	public Long getNodeId() {
		return nodeId;
	}
	public void setNodeId(Long nodeId) {
		this.nodeId = nodeId;
	}

}
