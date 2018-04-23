package com.dimension.service;

import java.util.List;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Basestation;
import com.dimension.pojo.File;
import com.dimension.pojo.Wifi;
/**
 * 
 * @author chengliao
 * @date 2018年3月8日
 * @Description:basenodebuild的初步构造
 */
public interface BaseNodeBuilder {
	 Long getNodeId() ;
	 void setNodeId(Long nodeId) ;

	boolean buildWifi();

	
	boolean buildFile();

	
	boolean buildBasestation();

	BaseNode getResult();
}
