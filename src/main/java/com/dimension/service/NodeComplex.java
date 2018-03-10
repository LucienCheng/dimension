package com.dimension.service;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.CaseNode;
/**
 * 
 * @author chengliao
 * @date 2018年3月7日
 * @Description: 产生一个完整的BaseNode。
 */
public interface NodeComplex {
	BaseNode constructBaseNode(Long nodeId);
	CaseNode constructCaseNode(Long nodeId);
}
