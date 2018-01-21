package com.dimension.pojo;

import java.io.Serializable;

public class Field implements Serializable {
    private Integer id;

    private String englishname;

    private String chinesename;

    private String fieldtype;

    private Integer nodeclassfyid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEnglishname() {
        return englishname;
    }

    public void setEnglishname(String englishname) {
        this.englishname = englishname == null ? null : englishname.trim();
    }

    public String getChinesename() {
        return chinesename;
    }

    public void setChinesename(String chinesename) {
        this.chinesename = chinesename == null ? null : chinesename.trim();
    }

    public String getFieldtype() {
        return fieldtype;
    }

    public void setFieldtype(String fieldtype) {
        this.fieldtype = fieldtype == null ? null : fieldtype.trim();
    }

    public Integer getNodeclassfyid() {
        return nodeclassfyid;
    }

    public void setNodeclassfyid(Integer nodeclassfyid) {
        this.nodeclassfyid = nodeclassfyid;
    }
}