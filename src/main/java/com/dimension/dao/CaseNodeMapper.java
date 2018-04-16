package com.dimension.dao;

import com.dimension.pojo.CaseNode;

import java.math.BigDecimal;

public interface CaseNodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CaseNode record);

    int insertSelective(CaseNode record);

    CaseNode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CaseNode record);

    int updateByPrimaryKey(CaseNode record);
    
    CaseNode getCaseNodeByNodeId(Long nodeId);
    //统计升级点的个数,用于解决重复点问题
    BigDecimal countByBaseNodeId(Long nodeId);
}