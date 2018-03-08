package com.dimension.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.dimension.pojo.Field;

public interface TableFieldMapper {
	/**
	 * 
	 * @Description: 返回的是一个查询的名字
	 * @param @param nodeId
	 * @param @param tableName
	 * @param @param tableField
	 * @param @return   
	 * @return Map<Integer,String>  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	String getFieldVariable(@Param("nodeId")Long nodeId,@Param("tableName") String tableName,@Param("tableField")String tableField);
	/**
	 * 
	 * @Description: 设置一个表的每一个域的值。
	 * @param @param var 《field,value》一个map拥有了一条记录的全部信息。
	 * @param @param tableName
	 * @param @param tableField
	 * @param @return   
	 * @return Integer  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	Integer		setFieldVariable(@Param("var")Map<String , Object> var,@Param("tableName")String tableName);
	/**
	 * 
	 * @Description: 删除某个表的具体记录
	 * @param @param id
	 * @param @param tableName
	 * @param @return   
	 * @return Integer  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	Integer		deleteById(@Param("id")Integer id,@Param("tableName")String tableName);
	/**
	 * 
	 * @Description: 创建一个表的结构,Fields的结构是《字段名称，字段类型》
	 * @param @param tableName
	 * @param @param Fields
	 * @param @return   
	 * @return Integer  
	 * @throws
	 * @author chengliao
	 * @date 2018年3月8日
	 */
	Integer 	createTable(@Param("tableName")String tableName,@Param("fields")List<Field> fields);
}
