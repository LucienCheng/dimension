package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.Field;

public interface FieldMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByTableId(Integer tableId);

    int insert(Field record);

    int insertSelective(Field record);

    Field selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Field record);

    int updateByPrimaryKey(Field record);
    
    List<Field> getFieldByTableId(Integer tableId);

    int maxFieldId(Integer tableid);
}