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
	private Date beginTime;
	// 结束时间
	private Date endTime;
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
	//可查询的部门id
	private List<Integer> DpIds;
	//自己所在的部门
	private Integer DpId;
	//所在的小组
	private Integer groupId;
	//
	private boolean isGrouper;
	//经纬度
	private BigDecimal firstlongitude;

	private BigDecimal firstlatitude;
	private BigDecimal secondlongitude;

	private BigDecimal secondlatitude;
	
	public void setLongLati(BigDecimal firstlongitude,BigDecimal firstlatitude,BigDecimal secondlongitude,BigDecimal secondlatitude) {
		this.firstlongitude = firstlongitude;
		this.firstlatitude = firstlatitude;
		this.secondlongitude = secondlongitude;
		this.secondlatitude = secondlatitude;
		
	}
	
	public void setTime( Date beginTime, Date endTime) {
		this.beginTime=beginTime;
		this.endTime=endTime;
	}

	public BigDecimal getFirstlongitude() {
		return firstlongitude;
	}

	public void setFirstlongitude(BigDecimal firstlongitude) {
		this.firstlongitude = firstlongitude;
	}

	public BigDecimal getFirstlatitude() {
		return firstlatitude;
	}

	public void setFirstlatitude(BigDecimal firstlatitude) {
		this.firstlatitude = firstlatitude;
	}

	public BigDecimal getSecondlongitude() {
		return secondlongitude;
	}

	public void setSecondlongitude(BigDecimal secondlongitude) {
		this.secondlongitude = secondlongitude;
	}

	public BigDecimal getSecondlatitude() {
		return secondlatitude;
	}

	public void setSecondlatitude(BigDecimal secondlatitude) {
		this.secondlatitude = secondlatitude;
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

	

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
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

	public boolean isGrouper() {
		return isGrouper;
	}

	public void setGrouper(boolean isGrouper) {
		this.isGrouper = isGrouper;
	}

	public List<Integer> getDpIds() {
		return DpIds;
	}

	public void setDpIds(List<Integer> dpIds) {
		DpIds = dpIds;
	}

	public Integer getDpId() {
		return DpId;
	}

	public void setDpId(Integer dpId) {
		DpId = dpId;
	}
}
