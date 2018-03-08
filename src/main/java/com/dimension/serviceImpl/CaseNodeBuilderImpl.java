package com.dimension.serviceImpl;

import javax.annotation.Resource;


import com.dimension.dao.CaseMapper;
import com.dimension.dao.CaseNodeMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseNode;
import com.dimension.service.BaseNodeBuilder;
import com.dimension.service.CaseNodeBuilder;

public class CaseNodeBuilderImpl implements CaseNodeBuilder {
	@Resource
	private CaseMapper caseMapper;
	@Resource
	private CaseNodeMapper caseNodeMapper;
	private Long nodeId;
	private BaseNodeBuilder baseNodeBuilder;
	@Override
	public BaseNode buildBaseNode(Long nodeId) {
		return baseNodeBuilder.getResult();
	}
	
	@Override
	public CaseNode getResult() {
		CaseNode caseNode=caseNodeMapper.getCaseNodeByNodeId(nodeId);
		caseNode.setCase1(buildCase(caseNode.getCaseid()));
		caseNode.setBaseNode(buildBaseNode(nodeId));
		return caseNode;
	}
	@Override
	public Case buildCase(Integer caseId) {
		// TODO Auto-generated method stub
		return caseMapper.selectByPrimaryKey(caseId);
	}
	public CaseNodeBuilderImpl(Long nodeId) {
		baseNodeBuilder=new BaseNodeBuilderImpl(nodeId);
		this.nodeId=nodeId;
	}

	
}
