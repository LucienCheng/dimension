package com.dimension.pojo;

import java.io.Serializable;

public class CaseNode implements Serializable {
    private Integer id;

    private Long nodeid;

    private String record;

    private Integer caseid;

    private Integer alarmid;
    
    //这个是一定有的基础点位信息
    private BaseNode baseNode;
    
    //这个是不一定有的，如果是来自与某个点位，就会有这个信息
    private Long baseNodeId;
    
    private Case case1;

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

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }

    public Integer getCaseid() {
        return caseid;
    }

    public void setCaseid(Integer caseid) {
        this.caseid = caseid;
    }

    public Integer getAlarmid() {
        return alarmid;
    }

    public void setAlarmid(Integer alarmid) {
        this.alarmid = alarmid;
    }

	public BaseNode getBaseNode() {
		return baseNode;
	}

	public void setBaseNode(BaseNode baseNode) {
		this.baseNode = baseNode;
	}

	public Case getCase1() {
		return case1;
	}

	public void setCase1(Case case1) {
		this.case1 = case1;
	}

	public Long getBaseNodeId() {
		return baseNodeId;
	}

	public void setBaseNodeId(Long baseNodeId) {
		this.baseNodeId = baseNodeId;
	}
}