package com.dimension.dao;

import java.util.List;

import com.dimension.pojo.File;

public interface FileMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(File record);

    int insertSelective(File record);

    File selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(File record);

    int updateByPrimaryKey(File record);
    
    List<File> getFileByNodeId(Long nodeId);
}