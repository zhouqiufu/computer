package com.TechnologyArea.service;

import java.util.List;

import com.TechnologyArea.dao.TechnologyAreaDao;
import com.TechnologyArea.domain.TechnologyArea;

public class TechnologyAreaService {

	public TechnologyAreaService() {
	}

	private TechnologyAreaDao technologyAreaDao;

	public TechnologyAreaDao getTechnologyAreaDao() {
		return technologyAreaDao;
	}

	public void setTechnologyAreaDao(TechnologyAreaDao technologyAreaDao) {
		this.technologyAreaDao = technologyAreaDao;
	}

	// 添加技术文章
	public boolean save(TechnologyArea technologyArea) {

		boolean isOk = false;

		technologyAreaDao.add(technologyArea);

		return isOk;
	}

	// 获取所有的标题
	public List<TechnologyArea> getAllTitle() {
		return technologyAreaDao.getAllTitle();
	}

	// 按标题获取技术文章
	public List<TechnologyArea> getTechnologyByTitle(String title) {

		List<TechnologyArea> list = null;
		list = technologyAreaDao.getTechnologyByTitle(title);
		return list;
	}

	// 按标题，删除技术文章
	public Boolean deleteTechnologyArticle(String title) {
		return technologyAreaDao.deleteTechnologyArticle(title);
	}

	// 获取前11个标题
	public List<TechnologyArea> get_11_newsTitle() {
		return technologyAreaDao.get_11_technologyTitle();
	}

	// 保存静态网页的信息
	public boolean saveHtmlInfo(String title, String htmlPath,
			String StaticHtmlName) {
		return technologyAreaDao.saveHtmlInfo(title, htmlPath, StaticHtmlName);
	}

	// 获取总结果数
	public int getTotalResult() {
		return technologyAreaDao.getTotalResult();
	}

	// 新闻分页
	public List<TechnologyArea> getPagingResult(int firstResult, int maxResult) {
		return technologyAreaDao.getPagingResult(firstResult, maxResult);
	}

}
