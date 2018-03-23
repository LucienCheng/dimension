package com.dimension.service;


import javax.annotation.Resource;

import com.dimension.pojo.Log;

public class CommandControl {

private Command command;
@Resource
private NodeAssit nodeAssit;

public  void saveLog(Log log) {
	command.execute(log);
}

public Command getCommand() {
	return command;
}

public void setCommand(Command command) {
	this.command = command;
}
}
