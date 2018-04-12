package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.Basestation;

public interface BasestationMapper {

    int insertSelective(Basestation record);


    List<Basestation> getBasestationByNodeId(Long nodeId);
}