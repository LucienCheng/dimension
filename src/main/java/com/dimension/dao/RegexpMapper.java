package com.dimension.dao;

import com.dimension.pojo.Regexp;

public interface RegexpMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Regexp record);

    int insertSelective(Regexp record);

    Regexp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Regexp record);

    int updateByPrimaryKey(Regexp record);
}