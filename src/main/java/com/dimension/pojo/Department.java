package com.dimension.pojo;

import java.io.Serializable;

public class Department implements Serializable {
    private Long id;

    private String longnumber;

    private String departmentname;

    private String departmentnumber;

    private String isvalid;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLongnumber() {
        return longnumber;
    }

    public void setLongnumber(String longnumber) {
        this.longnumber = longnumber == null ? null : longnumber.trim();
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname == null ? null : departmentname.trim();
    }

    public String getDepartmentnumber() {
        return departmentnumber;
    }

    public void setDepartmentnumber(String departmentnumber) {
        this.departmentnumber = departmentnumber == null ? null : departmentnumber.trim();
    }

    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
        this.isvalid = isvalid == null ? null : isvalid.trim();
    }
}