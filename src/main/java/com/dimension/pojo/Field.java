package com.dimension.pojo;

import java.io.Serializable;

public class Field implements Serializable {
    private Integer id;

    private String englishname;

    private String chinesename;

    private String fieldtype;

    private Integer tableid;

    private String value;

    private Regexp regexp;

    private Integer regexid;
    private String isvalid;
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

    public Regexp getRegexp() {
        return regexp;
    }

    public void setRegexp(Regexp regexp) {
        this.regexp = regexp;
    }

    public Integer getRegexid() {
        return regexid;
    }

    public void setRegexid(Integer regexid) {
        this.regexid = regexid;
    }

    public String getFieldtype() {
        return fieldtype;
    }

    public void setFieldtype(String fieldtype) {
        this.fieldtype = fieldtype == null ? null : fieldtype.trim();
    }

    public Integer getTableid() {
        return tableid;
    }

    public void setTableid(Integer tableid) {
        this.tableid = tableid;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Field{" +
                "id=" + id +
                ", englishname='" + englishname + '\'' +
                ", chinesename='" + chinesename + '\'' +
                ", fieldtype='" + fieldtype + '\'' +
                ", tableid=" + tableid +
                ", value='" + value + '\'' +
                ", regexp=" + regexp +
                ", isvalid='" + isvalid + '\'' +
                '}';
    }
}