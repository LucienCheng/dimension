package com.dimension.pojo;

import java.io.Serializable;
import java.util.Date;

public class File implements Serializable {
    private Integer id;

    private Long nodeid;

    private String filetype;

    private String filename;

    private String fileaddress;

    private Date updatetime;

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

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype == null ? null : filetype.trim();
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getFileaddress() {
        return fileaddress;
    }

    public void setFileaddress(String fileaddress) {
        this.fileaddress = fileaddress == null ? null : fileaddress.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}