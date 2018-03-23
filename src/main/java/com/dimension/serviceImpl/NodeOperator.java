package com.dimension.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimension.dao.LogMapper;
import com.dimension.pojo.Log;
@Service
public class NodeOperator {
	
@Resource
private LogMapper logMapper;

public void modify(Log log) {
	logMapper.insert(log);
}

public void add(Log log) {
	logMapper.insert(log);
}
public void resetNode(Log log) {
	logMapper.insert(log);
}
}
