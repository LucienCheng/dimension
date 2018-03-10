package com.dimension.pojo;

import java.io.Serializable;

public class Group implements Serializable {
    private Integer id;

    private String groupname;

    private String description;

    private Integer grouperid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getGrouperid() {
        return grouperid;
    }

    public void setGrouperid(Integer grouperid) {
        this.grouperid = grouperid;
    }
}