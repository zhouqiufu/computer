package com.leaveMessage.service;

import java.util.List;

import com.leaveMessage.dao.LeaveMessageDao;
import com.leaveMessage.domain.LeaveMessage;

public class LeaveMessageService {

	private LeaveMessageDao leaveMessageDao;
	private LeaveMessage leaveMessage;

	public LeaveMessageDao getLeaveMessageDao() {
		return leaveMessageDao;
	}

	public void setLeaveMessageDao(LeaveMessageDao leaveMessageDao) {
		this.leaveMessageDao = leaveMessageDao;
	}

	public LeaveMessage getLeaveMessage() {
		return leaveMessage;
	}

	public void setLeaveMessage(LeaveMessage leaveMessage) {
		this.leaveMessage = leaveMessage;
	}

	//
	public boolean add(LeaveMessage leaveMessage) {
		return leaveMessageDao.add(leaveMessage);
	}

	//
	public int getTotalResult() {
		return leaveMessageDao.getTotalResult();
	}

	// »ñÈ¡È«²¿ÁôÑÔ
	public List<LeaveMessage> getAllMessages() {
		return leaveMessageDao.getAllMessages();
	}

	// É¾³ıÁôÑÔ
	public boolean deleteMessage(String name, String dateTime) {
		return leaveMessageDao.deleteMessage(name, dateTime);
	}
}
