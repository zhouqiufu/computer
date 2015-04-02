package com.log4j;

import org.apache.log4j.Logger;

public class Log {

	private static Logger logger = Logger.getLogger(Log.class);

	public static Logger getLogger() {
		return logger;
	}

}
