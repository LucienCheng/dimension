package com.dimension.service;


import javax.annotation.Resource;

public class CommandControl {

private Command command;
@Resource
private NodeAssit nodeAssit;

public  void saveLog() {
	command.execute();
}

public Command getCommand() {
	return command;
}

public void setCommand(Command command) {
	this.command = command;
}
}
