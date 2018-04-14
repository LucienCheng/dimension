package com.dimension.pojo;

import java.util.Date;
import java.util.List;

public class CaseCondition {

	// 案件编号
	private String casecode;

	// 案件名字
	private String casename;

	// 案件类型
	private String casetype;


	// 案子开始时间
	private String beginTime;

	// 案子结束时间
	private String endTime;

	
	// 查询用户的角色
	private Integer roleId;

	//查询用户的用户id
	private Integer userId;
	
	// 可查询的子部门id
	private List<Integer> DpIds;
	
	// 自己所在的部门
	private Long departmentid;
	
	// 所在的小组(只是组员的)
	private List<Integer> groupIds;
	
	// 所在的小组（是组长的）
	private List<Integer> grouperIds;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<Integer> getGroupIds() {
		return groupIds;
	}

	public void setGroupIds(List<Integer> groupIds) {
		this.groupIds = groupIds;
	}

	public List<Integer> getGrouperIds() {
		return grouperIds;
	}

	public void setGrouperIds(List<Integer> grouperIds) {
		this.grouperIds = grouperIds;
	}

	public String getCasecode() {
		return casecode;
	}

	public void setCasecode(String casecode) {
		this.casecode = casecode;
	}

	public String getCasename() {
		return casename;
	}

	public void setCasename(String casename) {
		this.casename = casename;
	}

	public String getCasetype() {
		return casetype;
	}

	public void setCasetype(String casetype) {
		this.casetype = casetype;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public List<Integer> getDpIds() {
		return DpIds;
	}

	public void setDpIds(List<Integer> dpIds) {
		DpIds = dpIds;
	}

	public Long getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Long departmentid) {
		this.departmentid = departmentid;
	}

	@Override
	public String toString() {
		return "CaseCondition{" +
				"casecode='" + casecode + '\'' +
				", casename='" + casename + '\'' +
				", casetype='" + casetype + '\'' +
				", beginTime=" + beginTime +
				", endTime=" + endTime +
				", roleId=" + roleId +
				", userId=" + userId +
				", DpIds=" + DpIds +
				", departmentid=" + departmentid +
				", groupIds=" + groupIds +
				", grouperIds=" + grouperIds +
				'}';
	}
}
