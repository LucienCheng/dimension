package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.Basestation;

public interface BasestationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Basestation record);

    int insertSelective(Basestation record);

    Basestation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Basestation record);

    int updateByPrimaryKey(Basestation record);
    
    List<Basestation> getBasestationByNodeId(Long nodeId);
}