package com.dimension.pojo;

import java.io.Serializable;
import java.util.Date;

public class BaseNode implements Serializable {
    private Long nodeid;

    private Long longitude;

    private Long latitude;

    private String location;

    private Date collecttime;

    private String description;

    private String nodename;

    private Integer nodeclassfyid;

    private String address;

    private Integer userid;

    private Integer nodetype;

    private String isvalid;

    private static final long serialVersionUID = 1L;

    public Long getNodeid() {
        return nodeid;
    }

    public void setNodeid(Long nodeid) {
        this.nodeid = nodeid;
    }

    public Long getLongitude() {
        return longitude;
    }

    public void setLongitude(Long longitude) {
        this.longitude = longitude;
    }

    public Long getLatitude() {
        return latitude;
    }

    public void setLatitude(Long latitude) {
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

    public Integer getNodeclassfyid() {
        return nodeclassfyid;
    }

    public void setNodeclassfyid(Integer nodeclassfyid) {
        this.nodeclassfyid = nodeclassfyid;
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

    public Integer getNodetype() {
        return nodetype;
    }

    public void setNodetype(Integer nodetype) {
        this.nodetype = nodetype;
    }

    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
        this.isvalid = isvalid == null ? null : isvalid.trim();
    }
}