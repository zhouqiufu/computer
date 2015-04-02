package com.recordUserNumber.service;

import com.recordUserNumber.dao.RecordUserNumberDao;
import com.recordUserNumber.domain.RecordUserNumber;

public class RecordUserNumberService {

	public RecordUserNumberService() {
	}

	private RecordUserNumberDao recordUserNumberDao;

	public RecordUserNumberDao getRecordUserNumberDao() {
		return recordUserNumberDao;
	}

	public void setRecordUserNumberDao(RecordUserNumberDao recordUserNumberDao) {
		this.recordUserNumberDao = recordUserNumberDao;
	}

	// 添加
	public boolean add(RecordUserNumber recordUserNumber) {
		return recordUserNumberDao.add(recordUserNumber);
	}

	// 获取总结果数
	public int getTotalResult() {
		return recordUserNumberDao.getTotalResult();
	}

	// 查询当日的浏览量
	public int getDayTotalResult(String day,String month,String year) {
		return recordUserNumberDao.getDayTotalResult(day, month, year);
	}

	// 按月份查询浏览量
	public int getMonthTotalResult(String month,String year) {
		return recordUserNumberDao.getMonthTotalResult(month, year);
	}

	// 按年份查询浏览量
	public int getYearTotalResult(String year) {
		return recordUserNumberDao.getYearTotalResult(year);
	}
}
