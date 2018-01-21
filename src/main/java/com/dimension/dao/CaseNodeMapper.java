package com.dimension.dao;

import com.dimension.pojo.CaseNode;

public interface CaseNodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CaseNode record);

    int insertSelective(CaseNode record);

    CaseNode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CaseNode record);

    int updateByPrimaryKey(CaseNode record);
}