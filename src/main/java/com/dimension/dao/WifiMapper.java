package com.dimension.dao;

import com.dimension.pojo.Wifi;

public interface WifiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Wifi record);

    int insertSelective(Wifi record);

    Wifi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Wifi record);

    int updateByPrimaryKey(Wifi record);
}