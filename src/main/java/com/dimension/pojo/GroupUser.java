package com.dimension.pojo;

import java.io.Serializable;

public class GroupUser implements Serializable {
    private Integer id;

    private Integer groupid;

    private Integer userid;
private  String username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GroupUser groupUser = (GroupUser) o;

        return userid != null ? userid.equals(groupUser.userid) : groupUser.userid == null;
    }

    @Override
    public int hashCode() {
        return userid != null ? userid.hashCode() : 0;
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