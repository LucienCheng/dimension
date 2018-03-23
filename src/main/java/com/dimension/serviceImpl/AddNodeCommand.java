package com.dimension.serviceImpl;


import org.springframework.stereotype.Service;

import com.dimension.pojo.Log;
import com.dimension.service.Command;

@Service
public class AddNodeCommand extends Command {

	@Override
	public void execute(Log log) {
		NodeOperator.modify(log);
	}

}
