package com.dimension.service;

import java.util.List;
import java.util.Map;

import com.dimension.pojo.Field;
import com.dimension.pojo.Table;
import org.springframework.transaction.annotation.Transactional;

public interface TableFieldService {


    boolean createTable(Table table, List<Field> fields);

    //删除表
    boolean dropTable(Table table);

    //设置某个文本域
    int setField(String tableName, Map<String, Object> fields);

    //删除某个文本域
    boolean dropRecord(String tableName, Long nodeId);

    //插入某个记录
    int insertRecord(String tableName, Map<String, Object> fields);

    //获取某个点位
    List<Field> getFieldValue(Table table, Long nodeId);

}
