package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;

public interface BaseNodeMapper {
    int deleteByPrimaryKey(Long nodeid);

    int insert(BaseNode record);

    int insertSelective(BaseNode record);

    BaseNode selectByPrimaryKey(Long nodeid);

    int updateByPrimaryKeySelective(BaseNode record);

    int updateByPrimaryKey(BaseNode record);
    
    //搜索条件的点位
    List<BaseNode> selectBaseNode(BaseNodeConditon baseNodeConditon);

    int judgeEdited(BaseNodeConditon baseNodeConditon);
    int count(BaseNodeConditon baseNodeConditon);
    
}