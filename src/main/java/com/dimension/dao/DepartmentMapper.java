package com.dimension.dao;

import com.dimension.pojo.Department;

import java.util.List;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
//超级管理员的
    List<Department> subDepartment(String longnumber);
    //部门管理员
    List<Department> subPartDepartment(Long parentid);
}