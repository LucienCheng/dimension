package com.dimension.dao;


import com.dimension.pojo.Field;
import com.dimension.pojo.Table;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TableMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Table record);

    int insertSelective(Table record);

    Table selectByPrimaryKey(Integer id);

    List<Table> selectByCondition(@Param("table") Table table
            , @Param("start") Integer start
            , @Param("count") Integer count
    );

    Integer count(@Param("table") Table table);

    int updateByPrimaryKeySelective(Table record);

    int updateByPrimaryKey(Table record);

    List<Field> getField(Integer id);


}