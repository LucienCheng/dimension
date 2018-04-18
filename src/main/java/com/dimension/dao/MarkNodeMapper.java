package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.BaseNode;
import com.dimension.pojo.BaseNodeConditon;
import com.dimension.pojo.MarkNode;
import org.apache.ibatis.annotations.Param;

public interface MarkNodeMapper {
    int deleteByPrimaryKey(Long markid);

    int insertSelective(MarkNode record);

    Integer selectByNodeIdUser(MarkNode markNode);
     List<BaseNode> searchMarkNode(
            @Param("baseNodeConditon") BaseNodeConditon baseNodeConditon,
            @Param("userId") Integer userId,
            @Param("start") Integer start,
            @Param("count") Integer count) ;
    int count( @Param("baseNodeConditon") BaseNodeConditon baseNodeConditon,
           @Param("userId") Integer userId);
    int isExist(@Param("nodeId") Long nodeId,@Param("userId") Integer userId);

    List<MarkNode> getMarkByUser(int userid);
}