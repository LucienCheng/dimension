package com.dimension.pojo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 
 * @author chengliao
 * @date 2018年3月10日
 * @Description:点位搜索的条件
 */
public class BaseNodeConditon {
	// 开始时间
	private String beginTime;
	// 结束时间
	private String endTime;
	// 点位的名字
	private String nodename;
	// 点位的类型
	private Integer nodetype;
	// 点位的地址
	private String address;
	//查询用户的id
	private Integer userId;
	//查询用户的角色
	private Integer roleId;
	//可查询的子部门id
	private List<Long> DpIds;
	//自己所在的部门
	private Long DpId;
	//所在的小组(只是组员的)
	private List<Integer> groupIds;
	//所在的小组（是组长的）
	private List<Integer> grouperIds;
	private Integer start;
	private Integer count;

	public void setTime( String beginTime, String endTime) {
		this.beginTime=beginTime;
		this.endTime=endTime;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
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

	public String getNodename() {
		return nodename;
	}

	public void setNodename(String nodename) {
		this.nodename = nodename;
	}

	public Integer getNodetype() {
		return nodetype;
	}

	public void setNodetype(Integer nodetype) {
		this.nodetype = nodetype;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	

	public List<Long> getDpIds() {
		return DpIds;
	}

	public void setDpIds(List<Long> dpIds) {
		DpIds = dpIds;
	}

	public Long getDpId() {
		return DpId;
	}

	public void setDpId(Long dpId) {
		DpId = dpId;
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

	@Override
	public String toString() {
		return "BaseNodeConditon{" +
				"beginTime='" + beginTime + '\'' +
				", endTime='" + endTime + '\'' +
				", nodename='" + nodename + '\'' +
				", nodetype=" + nodetype +
				", address='" + address + '\'' +
				", userId=" + userId +
				", roleId=" + roleId +
				", DpIds=" + DpIds +
				", DpId=" + DpId +
				", groupIds=" + groupIds +
				", grouperIds=" + grouperIds +
				", start=" + start +
				", count=" + count +
				'}';
	}
}
