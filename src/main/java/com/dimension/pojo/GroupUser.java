package com.dimension.pojo;

import java.io.Serializable;

public class GroupUser implements Serializable {
    private Integer id;

    private Integer groupid;

    private Integer userid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "GroupUser{" +
                "id=" + id +
                ", groupid=" + groupid +
                ", userid=" + userid +
                '}';
    }
}