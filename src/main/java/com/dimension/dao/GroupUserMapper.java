package com.dimension.dao;

import com.dimension.pojo.GroupUser;

import java.util.List;

public interface GroupUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupUser record);

    int insertSelective(GroupUser record);

    GroupUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupUser record);

    int updateByPrimaryKey(GroupUser record);

    List<GroupUser> getGrouperByCaseId(Integer caseId);
    List<GroupUser> getUserByDepartId(Long departmentId);
}