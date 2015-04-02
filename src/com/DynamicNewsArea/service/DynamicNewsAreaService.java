package com.DynamicNewsArea.service;

import java.util.List;

import com.DynamicNewsArea.dao.DynamicNewsAreaDao;
import com.DynamicNewsArea.domain.DynamicNewsArea;

public class DynamicNewsAreaService {

	public DynamicNewsAreaService() {
	}

	private DynamicNewsAreaDao dynamicNewsAreaDao;

	public DynamicNewsAreaDao getDynamicNewsAreaDao() {
		return dynamicNewsAreaDao;
	}

	public void setDynamicNewsAreaDao(DynamicNewsAreaDao dynamicNewsAreaDao) {
		this.dynamicNewsAreaDao = dynamicNewsAreaDao;
	}

	// 添加新闻
	public boolean save(DynamicNewsArea dynamicNewsArea) {

		boolean isOk = false;

		dynamicNewsAreaDao.add(dynamicNewsArea);

		return isOk;
	}

	// 按标题获取新闻
	public List<DynamicNewsArea> getNewsByTitle(String title) {

		List<DynamicNewsArea> list = null;
		list = dynamicNewsAreaDao.getNewsByTitle(title);
		return list;
	}

	// 获取所有的新闻标题
	public List<DynamicNewsArea> getAllNewsTitle() {
		return dynamicNewsAreaDao.getAllNewsTitle();
	}

	// 按标题，删除新闻
	public Boolean deleteNews(String title) {
		return dynamicNewsAreaDao.deleteNews(title);
	}

	// 获取前13个标题
	public List<DynamicNewsArea> get_13_newsTitle() {
		return dynamicNewsAreaDao.get_13_newsTitle();
	}

	// 保存静态网页的信息
	public boolean saveHtmlInfo(String title, String htmlPath,
			String StaticHtmlName) {
		return dynamicNewsAreaDao.saveHtmlInfo(title, htmlPath, StaticHtmlName);
	}

	// 获取总结果数
	public int getTotalResult() {
		return dynamicNewsAreaDao.getTotalResult();
	}

	// 新闻分页
	public List<DynamicNewsArea> getPagingResult(int firstResult, int maxResult) {
		return dynamicNewsAreaDao.getPagingResult(firstResult, maxResult);
	}

}
