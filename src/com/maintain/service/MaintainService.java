package com.maintain.service;

import java.util.List;

import com.leaveMessage.domain.LeaveMessage;
import com.maintain.dao.MaintainDao;
import com.maintain.domain.Maintain;

public class MaintainService {

	private MaintainDao maintainDao;
	private Maintain maintain;

	public MaintainDao getMaintainDao() {
		return maintainDao;
	}

	public void setMaintainDao(MaintainDao maintainDao) {
		this.maintainDao = maintainDao;
	}

	public Maintain getMaintain() {
		return maintain;
	}

	public void setMaintain(Maintain maintain) {
		this.maintain = maintain;
	}

	// 添加
	public boolean add(Maintain maintain) {
		return maintainDao.add(maintain);
	}

	// 获取总结果数
	public int getTotalResult() {
		return maintainDao.getTotalResult();
	}

	public List<Maintain> getAllMessages() {
		return maintainDao.getAllMaintains();
	}

	public boolean deleteMessage(String name, String dateTime) {
		return maintainDao.deleteMaintain(name, dateTime);
	}

}
