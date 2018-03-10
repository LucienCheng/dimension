package com.dimension.service;

import javax.annotation.Resource;

import com.dimension.serviceImpl.NodeOperator;

public abstract class Command {
	@Resource
	protected NodeOperator NodeOperator;

	public abstract void execute();
}
