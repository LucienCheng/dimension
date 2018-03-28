package com.dimension.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class User implements Serializable {
    private Integer id;

    private Integer roleid;

    private String username;

    private String password;

    private String identityid;

    private String telephone;

    private Long departmentid;

    private Date generatortime;

    private Date logintime;

    private String isvalid;

    private String description;
    
    private Department department;

    private String rolename;



    private List<Long> subDepartment;
    private List<Department> subDepartments;

    private static final long serialVersionUID = 1L;



    public List<Long> getSubDepartment() {
        return subDepartment;
    }

    public List<Department> getSubDepartments() {
        return subDepartments;
    }

    public void setSubDepartments(List<Department> subDepartments) {
        this.subDepartments = subDepartments;
    }

    public void setSubDepartment(List<Long> subDepartment) {
        this.subDepartment = subDepartment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getIdentityid() {
        return identityid;
    }

    public void setIdentityid(String identityid) {
        this.identityid = identityid == null ? null : identityid.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public Long getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Long departmentid) {
        this.departmentid = departmentid;
    }

    public Date getGeneratortime() {
        return generatortime;
    }

    public void setGeneratortime(Date generatortime) {
        this.generatortime = generatortime;
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
        this.isvalid = isvalid == null ? null : isvalid.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", roleid=" + roleid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", identityid='" + identityid + '\'' +
                ", telephone='" + telephone + '\'' +
                ", departmentid=" + departmentid +
                ", generatortime=" + generatortime +
                ", logintime=" + logintime +
                ", isvalid='" + isvalid + '\'' +
                ", description='" + description + '\'' +
                ", department=" + department +
                ", rolename='" + rolename + '\'' +
                '}';
    }
}