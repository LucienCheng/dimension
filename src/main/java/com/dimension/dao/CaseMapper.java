package com.dimension.dao;

import com.dimension.pojo.Case;

public interface CaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Case record);

    int insertSelective(Case record);

    Case selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Case record);

    int updateByPrimaryKey(Case record);
}