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
    
    //搜索可编辑的点位
    List<BaseNode> selectEdited(BaseNodeConditon baseNodeConditon);
    
    //搜索只能查看的点位
    List<BaseNode> selectUnEdited(BaseNodeConditon baseNodeConditon);
    
}