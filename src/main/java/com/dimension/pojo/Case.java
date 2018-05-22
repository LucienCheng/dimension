package com.dimension.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Case implements Serializable {
    private Integer id;

    private String casecode;

    private String casename;

    private String casetype;

    private String description;

    private String abstracts;

    private Integer groupid;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date begintime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date endtime;
    
    private Long departmentId;
    //是否可以编辑这个案件
    private int isEdited;

    private double similar;

    private Integer grouperid;
    private static final long serialVersionUID = 1L;

    public double getSimilar() {
        return similar;
    }

    public void setSimilar(double similar) {
        this.similar = similar;
    }

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGrouperid() {
        return grouperid;
    }

    public void setGrouperid(Integer grouperid) {
        this.grouperid = grouperid;
    }

    public String getCasecode() {
        return casecode;
    }

    public void setCasecode(String casecode) {
        this.casecode = casecode == null ? null : casecode.trim();
    }

    public String getCasename() {
        return casename;
    }

    public void setCasename(String casename) {
        this.casename = casename == null ? null : casename.trim();
    }

    public String getCasetype() {
        return casetype;
    }

    public void setCasetype(String casetype) {
        this.casetype = casetype == null ? null : casetype.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

	public int getIsEdited() {
		return isEdited;
	}

	public void setIsEdited(int isEdited) {
		this.isEdited = isEdited;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

    @Override
    public String toString() {
        return "Case{" +
                "id=" + id +
                ", casecode='" + casecode + '\'' +
                ", casename='" + casename + '\'' +
                ", casetype='" + casetype + '\'' +
                ", description='" + description + '\'' +
                ", abstracts='" + abstracts + '\'' +
                ", groupid=" + groupid +
                ", begintime=" + begintime +
                ", endtime=" + endtime +
                ", departmentId=" + departmentId +
                ", isEdited=" + isEdited +
                ", grouperid=" + grouperid +
                '}';
    }
}