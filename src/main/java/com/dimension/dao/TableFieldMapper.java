package com.dimension.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dimension.pojo.Field;
import org.apache.ibatis.session.ResultHandler;

public interface TableFieldMapper {
	// 获得某个字段的值
	String getFieldVariable(@Param("nodeId") Long nodeId, @Param("tableName") String tableName,
			@Param("tableField") String tableField);

	// 设置某个表的值，里面必须有一个nodeId
	Integer setFieldVariable(@Param("var") Map<String, Object> var, @Param("tableName") String tableName);

	// 插入一个字段信息，必须有全部的信息
	Integer insertRecord(@Param("var") Map<String, Object> var, @Param("tableName") String tableName);

	// 通过nodeId删除记录
	Integer deleteById(@Param("nodeId") Long nodeId, @Param("tableName") String tableName);

	// 创建一个表的结构,Fields的结构是《字段名称，字段类型》
	Integer createTable(@Param("tableName") String tableName, @Param("fields") List<Field> fields);

	// 删除表
	Integer dropTable(String tableName);

	// 添加字段
	Integer addField(@Param("tableName") String tableName, @Param("field") String field, @Param("type") String type);

	// 删除字段
	Integer dropField(@Param("tableName") String tableName, @Param("field") String field);

	// 修改字段
	Integer alterField(@Param("tableName") String tableName, @Param("origin") String origin, @Param("dest") String dest,
			@Param("type") String type);


	//获取每个表的点位个数
	Map<Integer,Integer> count(ResultHandler resultHandler);

}