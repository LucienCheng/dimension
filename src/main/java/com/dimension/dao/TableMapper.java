package com.dimension.dao;


import com.dimension.pojo.Table;

public interface TableMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Table record);

    int insertSelective(Table record);

    Table selectByPrimaryKey(Integer id);
    
    Table selectByCondition(Table record);

    int updateByPrimaryKeySelective(Table record);

    int updateByPrimaryKey(Table record);
}