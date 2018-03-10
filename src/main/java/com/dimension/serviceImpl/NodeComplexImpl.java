package com.dimension.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import com.dimension.dao.FieldMapper;
import com.dimension.dao.TableFieldMapper;
import com.dimension.dao.TableMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.CaseNode;
import com.dimension.pojo.Field;
import com.dimension.pojo.Table;
import com.dimension.service.BaseNodeBuilder;
import com.dimension.service.CaseNodeBuilder;
import com.dimension.service.NodeComplex;
import com.dimension.service.TableFieldService;

public class NodeComplexImpl implements NodeComplex {
	@Resource
	private TableFieldService tableFieldService;
	@Resource
	private TableMapper tableMapper;
	@Resource
	private BaseNodeBuilder baseNodeBuilder;
	@Resource
	private CaseNodeBuilder caseNodeBuilder;
	/**
	 * 复杂的构造一个基本点，首先构造基本的信息的点，然后从table中搜索，然后再从文本域中搜索，然后再动态检索表，和字段信息
	 */
	@Override
	public BaseNode constructBaseNode(Long nodeId) {
		baseNodeBuilder.setNodeId(nodeId);
		baseNodeBuilder.buildBasestation();
		baseNodeBuilder.buildFile();
		baseNodeBuilder.buildWifi();
		BaseNode baseNode = baseNodeBuilder.getResult();
		if (baseNode.getTableid()!=null) {
			Table table = tableMapper.selectByPrimaryKey(baseNode.getTableid());
			List<Field> fields=tableFieldService.getFieldValue(table, nodeId);
			// 设置文本域
			baseNode.setOther(fields);
			baseNode.setTable(table);
		}
		return baseNode;
	}

	/**
	 * 构造一个复杂的案件点。
	 */
	@Override
	public CaseNode constructCaseNode(Long nodeId) {
		caseNodeBuilder.setNodeId(nodeId);
		caseNodeBuilder.buildCase();
		CaseNode caseNode = caseNodeBuilder.getResult();
		caseNode.setBaseNode(constructBaseNode(nodeId));
		return caseNode;
	}
	
	

}
