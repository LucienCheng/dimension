package com.dimension.pojo;

import java.io.Serializable;

public class Wifi implements Serializable {
    private Integer id;

    private Long nodeid;

    private Integer wifiid;

    private Integer ch;

    private Integer rssi;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getNodeid() {
        return nodeid;
    }

    public void setNodeid(Long nodeid) {
        this.nodeid = nodeid;
    }

    public Integer getWifiid() {
        return wifiid;
    }

    public void setWifiid(Integer wifiid) {
        this.wifiid = wifiid;
    }

    public Integer getCh() {
        return ch;
    }

    public void setCh(Integer ch) {
        this.ch = ch;
    }

    public Integer getRssi() {
        return rssi;
    }

    public void setRssi(Integer rssi) {
        this.rssi = rssi;
    }
}