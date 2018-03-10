package com.dimension.service;

import java.util.List;
import java.util.Map;

import com.dimension.pojo.Field;
import com.dimension.pojo.Table;
/**
 * 
 * @author chengliao
 * @date 2018年3月8日
 * @Description:提供动态表操作的主要服务。
 */
public interface TableFieldService {

boolean createTable(Table table,List<Field> fields);

boolean dropTable(Table table);

boolean setField(String tableName,Map<String , Object> fields);

boolean dropRecord(String tableName,Long nodeId);

boolean insertRecord(String tableName,Map<String , Object> fields);

List<Field> getFieldValue(Table table,Long nodeId);
}
