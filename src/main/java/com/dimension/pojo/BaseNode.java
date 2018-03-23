package com.dimension.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class BaseNode implements Serializable, Comparable<BaseNode> {
	private Long nodeid;

	private BigDecimal longitude;

	private BigDecimal latitude;

	private String location;

	private Date collecttime;

	private String description;

	private String nodename;

	private Integer tableid;

	private String address;

	private Integer userid;

	private String nodetype;

	private String isvalid;

	private List<Wifi> wifis;

	private List<Basestation> basestations;

	private List<File> files;

	private List<Field> other;

	private Table table;
	//添加是否为同一个点信息
	private String text;

	// 是否可以编辑这个点
	private int isEdited;

	private static final long serialVersionUID = 1L;

	public Long getNodeid() {
		return nodeid;
	}

	public void setNodeid(Long nodeid) {
		this.nodeid = nodeid;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location == null ? null : location.trim();
	}

	public Date getCollecttime() {
		return collecttime;
	}

	public void setCollecttime(Date collecttime) {
		this.collecttime = collecttime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public String getNodename() {
		return nodename;
	}

	public void setNodename(String nodename) {
		this.nodename = nodename == null ? null : nodename.trim();
	}

	public Integer getTableid() {
		return tableid;
	}

	public void setTableid(Integer tableid) {
		this.tableid = tableid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getNodetype() {
		return nodetype;
	}

	public void setNodetype(String nodetype) {
		this.nodetype = nodetype;
	}

	public String getIsvalid() {
		return isvalid;
	}

	public void setIsvalid(String isvalid) {
		this.isvalid = isvalid == null ? null : isvalid.trim();
	}

	public List<Wifi> getWifis() {
		return wifis;
	}

	public void setWifis(List<Wifi> wifis) {
		this.wifis = wifis;
	}

	public List<Basestation> getBasestations() {
		return basestations;
	}

	public void setBasestations(List<Basestation> basestations) {
		this.basestations = basestations;
	}

	public List<File> getFiles() {
		return files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	public List<Field> getOther() {
		return other;
	}

	public void setOther(List<Field> other) {
		this.other = other;
	}

	public Table getTable() {
		return table;
	}

	public void setTable(Table table) {
		this.table = table;
	}

	public int getIsEdited() {
		return isEdited;
	}

	public void setIsEdited(int isEdited) {
		this.isEdited = isEdited;
	}

	@Override
	public int compareTo(BaseNode o) {
		//比较经度，小于就返回-1；
		if (o.latitude.compareTo(latitude) == -1)
			return -1;
		//等于经度继续下去
		if (o.latitude.equals(this.latitude)) {
			// 当经纬度相同的时候就相等，
			if (o.longitude.compareTo(longitude) == 0) {
				return 0;
			}
			if (o.longitude.compareTo(longitude) == 1) {
				return 1;
			}
			if (o.longitude.compareTo(longitude) == -1) {
				return -1;
			}
		}
		//其他情况为大于
		return 1;

	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((latitude == null) ? 0 : latitude.hashCode());
		result = prime * result + ((longitude == null) ? 0 : longitude.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BaseNode other = (BaseNode) obj;
		if (latitude == null) {
			if (other.latitude != null)
				return false;
		} else if (!latitude.equals(other.latitude))
			return false;
		if (longitude == null) {
			if (other.longitude != null)
				return false;
		} else if (!longitude.equals(other.longitude))
			return false;
		return true;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}