package com.dimension.pojo;

import java.io.Serializable;

public class Message implements Serializable {
    private Integer id;

    private Integer userid;

    private Integer caseid;

    private String content;

    private Integer submittime;

    private String replyconten;

    private Integer replytime;

    private String state;

    private Long departionid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getCaseid() {
        return caseid;
    }

    public void setCaseid(Integer caseid) {
        this.caseid = caseid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getSubmittime() {
        return submittime;
    }

    public void setSubmittime(Integer submittime) {
        this.submittime = submittime;
    }

    public String getReplyconten() {
        return replyconten;
    }

    public void setReplyconten(String replyconten) {
        this.replyconten = replyconten == null ? null : replyconten.trim();
    }

    public Integer getReplytime() {
        return replytime;
    }

    public void setReplytime(Integer replytime) {
        this.replytime = replytime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Long getDepartionid() {
        return departionid;
    }

    public void setDepartionid(Long departionid) {
        this.departionid = departionid;
    }
}