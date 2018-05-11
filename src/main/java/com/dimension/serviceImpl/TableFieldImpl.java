package com.dimension.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimension.dao.FieldMapper;
import com.dimension.dao.TableFieldMapper;
import com.dimension.dao.TableMapper;
import com.dimension.pojo.Field;
import com.dimension.pojo.Table;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TableFieldImpl implements com.dimension.service.TableFieldService {
	@Resource
private TableFieldMapper tableFieldMapper;
	@Resource
	private TableMapper tableMapper;
	@Resource
	private FieldMapper fieldMapper;
	@Override
	@Transactional(rollbackFor=Exception.class)
	@Rollback(true)
	public boolean createTable(Table table, List<Field> fields) {
		tableFieldMapper.createTable(table.getEnglishname(), fields);
		tableMapper.insertSelective(table);
		for (Field field : fields) {
			field.setTableid(table.getId());
			fieldMapper.insertSelective(field);
		}
		Field record=new Field();
		record.setEnglishname("nodeId");
		record.setChinesename("唯一标识");
		record.setFieldtype("bigint");
		record.setTableid(table.getId());
		fieldMapper.insertSelective(record);
		return true;
	}

	@Override
	public boolean dropTable(Table table) {

		fieldMapper.deleteByTableId(table.getId());
		tableFieldMapper.dropTable(table.getEnglishname());
		
		return true;
	}

	@Override
	public int setField(String tableName, Map<String , Object> fields) {
		return tableFieldMapper.setFieldVariable(fields, tableName);
	}

	@Override
	public boolean dropRecord(String tableName, Long nodeId) {
		tableFieldMapper.deleteById(nodeId, tableName);
		return true;
	}

	@Override
	public List<Field> getFieldValue(Table table, Long nodeId) {
		System.out.println("设置值");
		List<Field> fields=fieldMapper.getFieldByTableId(table.getId());
		for (Field field : fields) {
			if (!field.getEnglishname().equals("nodeId")){
				field.setValue(tableFieldMapper.getFieldVariable(nodeId, table.getEnglishname(), field.getEnglishname()));
				System.out.println(field);
			}
		}
		return fields;
	}

	@Override
	public int insertRecord(String tableName, Map<String, Object> fields) {
		return tableFieldMapper.insertRecord(fields, tableName);
	}

}
