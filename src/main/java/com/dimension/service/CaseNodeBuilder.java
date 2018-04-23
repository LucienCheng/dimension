package com.dimension.service;


import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseNode;
/**
 * 
 * @author chengliao
 * @date 2018年3月8日
 * @Description:案件点的初步构造
 */
public interface CaseNodeBuilder {
	 Long getNodeId();

	 void setNodeId(Long nodeId);
	
	boolean buildCase();
	

	CaseNode getResult();
}
