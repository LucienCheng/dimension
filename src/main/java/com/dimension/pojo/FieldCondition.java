package com.dimension.pojo;

public class FieldCondition {
    private String englishname;
    private String value;
    private String tablename;
    private Long nodeid;

    public String getEnglishname() {
        return englishname;
    }

    public void setEnglishname(String englishname) {
        this.englishname = englishname;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename;
    }

    public Long getNodeid() {
        return nodeid;
    }

    public void setNodeid(Long nodeid) {
        this.nodeid = nodeid;
    }

    @Override
    public String toString() {
        return "FieldCondition{" +
                "englishname='" + englishname + '\'' +
                ", value='" + value + '\'' +
                ", tablename='" + tablename + '\'' +
                ", nodeid=" + nodeid +
                '}';
    }
}
