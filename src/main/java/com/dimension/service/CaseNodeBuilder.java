package com.dimension.service;


import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseNode;

public interface CaseNodeBuilder {
	/**
	 * 
	 * @Description: 创建案件信息
	 * @param @param caseId
	 * @param @return   
	 * @return Case  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	Case buildCase(Integer caseId);
	/**
	 * 
	 * @Description: 创建基础点位信息
	 * @param @param nodeId
	 * @param @return   
	 * @return BaseNode  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	BaseNode buildBaseNode(Long nodeId);
	/**
	 * 
	 * @Description: 获取一个基本案件点位信息
	 * @param @return   
	 * @return CaseNode  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	CaseNode getResult();
}
