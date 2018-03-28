package com.dimension.pojo;

import java.util.List;

public class UserCondition {
    private String username;
    private String department;
    private List<Long> subDepartmentId;
    private Integer roleId;
    private Long departmentid;

    public Long getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Long departmentid) {
        this.departmentid = departmentid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "UserCondition{" +
                "username='" + username + '\'' +
                ", department='" + department + '\'' +
                ", subDepartmentId=" + subDepartmentId +
                ", roleId=" + roleId +
                '}';
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public List<Long> getSubDepartmentId() {
        return subDepartmentId;
    }

    public void setSubDepartmentId(List<Long> subDepartmentId) {
        this.subDepartmentId = subDepartmentId;
    }
}
