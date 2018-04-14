package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.MarkNode;
import org.apache.ibatis.annotations.Param;

public interface MarkNodeMapper {
    int deleteByPrimaryKey(Long markid);

    int insert(MarkNode record);

    int insertSelective(MarkNode record);

    MarkNode selectByPrimaryKey(Long markid);

    int updateByPrimaryKeySelective(MarkNode record);

    int updateByPrimaryKey(MarkNode record);
    
    public List<BaseNode> searchMarkNode(@Param("userId") Integer userId,@Param("start") Integer start,@Param("count") Integer count) ;

    int isExist(@Param("nodeId") Long nodeId,@Param("userId") Integer userId);
}