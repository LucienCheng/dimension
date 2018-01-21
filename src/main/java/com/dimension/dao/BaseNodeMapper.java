package com.dimension.dao;

import com.dimension.pojo.BaseNode;

public interface BaseNodeMapper {
    int deleteByPrimaryKey(Long nodeid);

    int insert(BaseNode record);

    int insertSelective(BaseNode record);

    BaseNode selectByPrimaryKey(Long nodeid);

    int updateByPrimaryKeySelective(BaseNode record);

    int updateByPrimaryKey(BaseNode record);
}