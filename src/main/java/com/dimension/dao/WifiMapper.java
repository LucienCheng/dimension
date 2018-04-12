package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.Wifi;

public interface WifiMapper {

    int insertSelective(Wifi record);

    List<Wifi> getWifiByNodeId(Long nodeId);
}