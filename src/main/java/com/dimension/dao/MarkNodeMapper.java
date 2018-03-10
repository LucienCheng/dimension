package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.MarkNode;

public interface MarkNodeMapper {
    int deleteByPrimaryKey(Long markid);

    int insert(MarkNode record);

    int insertSelective(MarkNode record);

    MarkNode selectByPrimaryKey(Long markid);

    int updateByPrimaryKeySelective(MarkNode record);

    int updateByPrimaryKey(MarkNode record);
    
    public List<BaseNode> searchMarkNode(Integer userId) ;
}