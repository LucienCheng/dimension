package com.dimension.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.New;

import org.springframework.stereotype.Service;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.dao.BasestationMapper;
import com.dimension.dao.FileMapper;
import com.dimension.dao.WifiMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Basestation;
import com.dimension.pojo.File;
import com.dimension.pojo.Wifi;
@Service
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
	
	private BaseNode baseNode;
	
	
	@Override
	public boolean buildWifi() {
		baseNode.setWifis( wifiMapper.getWifiByNodeId(nodeId));
		return true;
	}

	@Override
	public boolean buildFile() {
		baseNode.setFiles(fileMapper.getFileByNodeId(nodeId)); 
		return true;
	}

	@Override
	public boolean buildBasestation() {
		baseNode.setBasestations(basestationMapper.getBasestationByNodeId(nodeId));
		return true;
		
	}

	@Override
	public BaseNode getResult() {
		return baseNode;
	}
	public Long getNodeId() {
		return nodeId;
	}
	public void setNodeId(Long nodeId) {
		 baseNode=baseNodeMapper.selectByPrimaryKey(nodeId);
		this.nodeId = nodeId;
	}

	

}
