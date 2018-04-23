package com.dimension.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimension.dao.CaseMapper;
import com.dimension.dao.CaseNodeMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseNode;
import com.dimension.service.BaseNodeBuilder;
import com.dimension.service.CaseNodeBuilder;

@Service
public class CaseNodeBuilderImpl implements CaseNodeBuilder {
	@Resource
	private CaseMapper caseMapper;
	@Resource
	private CaseNodeMapper caseNodeMapper;
	@Resource
	private BaseNodeBuilder baseNodeBuilder;
	private Long nodeId;
	private CaseNode caseNode;
	private BaseNode baseNode;
	@Override
	public CaseNode getResult() {
		return caseNode;
	}

	@Override
	public boolean buildCase() {
		caseNode.setCase1(caseMapper.selectByPrimaryKey(caseNode.getCaseid()));
		return true;

	}

	public Long getNodeId() {
		return nodeId;
	}

	public void setNodeId(Long nodeId) {
		caseNode = caseNodeMapper.getCaseNodeByNodeId(nodeId);
		baseNodeBuilder.setNodeId(nodeId);
		baseNode = baseNodeBuilder.getResult();
		caseNode.setBaseNode(baseNode);
		this.nodeId = nodeId;
	}


	
}
