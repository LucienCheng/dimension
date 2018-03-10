package com.dimension.serviceImpl;

import com.dimension.service.Command;

public class ResetNodeCommand extends Command {

	@Override
	public void execute() {
		NodeOperator.modify();
	}

}
