package com.dimension.pojo;

import java.io.Serializable;

public class MarkNode implements Serializable {
    private Long markid;

    private Integer userid;

    private Long nodeid;

    private Integer isedited;

    private static final long serialVersionUID = 1L;

    public Long getMarkid() {
        return markid;
    }

    public void setMarkid(Long markid) {
        this.markid = markid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Long getNodeid() {
        return nodeid;
    }

    public void setNodeid(Long nodeid) {
        this.nodeid = nodeid;
    }

    public Integer getIsedited() {
        return isedited;
    }

    public void setIsedited(Integer isedited) {
        this.isedited = isedited;
    }
}