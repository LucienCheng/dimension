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
import com.dimension.service.NodeComplex;

public class NodeComplexImpl implements NodeComplex {
	@Resource
	private TableMapper tableMapper;
	@Resource
	private FieldMapper fieldMapper;
	@Resource
	private TableFieldMapper tableFieldMapper;
	private BaseNodeBuilder baseNodeBuilder;
	/**
	 * 复杂的构造一个基本点，首先构造基本的信息的点，然后从table中搜索，然后再从文本域中搜索，然后再动态检索表，和字段信息
	 */
	@Override
	public BaseNode constructBaseNode(Long nodeId) {
		baseNodeBuilder.setNodeId(nodeId);
		BaseNode baseNode = baseNodeBuilder.getResult();
		if (baseNode.getTableid()!=null) {
			Table table = tableMapper.selectByPrimaryKey(baseNode.getTableid());
			List<Field> fields = fieldMapper.getFieldByTableId(baseNode.getTableid());
			// 获取每个文本域的值
			for (Field field : fields) {
				field.setValue(tableFieldMapper.getFieldVariable(nodeId, table.getEnglishname(),field.getEnglishname()));
			}
			// 设置文本域
			baseNode.setOther(fields);
			baseNode.setTable(table);
		}
		return baseNode;
	}

	/**
	 * 构造一个案件点。
	 */
	@Override
	public CaseNode constructCaseNode(Long nodeId) {
		BaseNode baseNode = constructBaseNode(nodeId);
		CaseNode caseNode = new CaseNodeBuilderImpl(nodeId).getResult();
		caseNode.setBaseNode(baseNode);
		return caseNode;
	}
	public NodeComplexImpl(Long nodeId) {
		baseNodeBuilder = new BaseNodeBuilderImpl(nodeId);
	}

}
