package com.AnnounceArea.service;

import java.util.List;

import com.AnnounceArea.dao.AnnounceAreaDao;
import com.AnnounceArea.domain.AnnounceDomain;

public class announceService {

	private AnnounceAreaDao announceAreaDao;

	public AnnounceAreaDao getAnnounceAreaDao() {
		return announceAreaDao;
	}

	public void setAnnounceAreaDao(AnnounceAreaDao announceAreaDao) {
		this.announceAreaDao = announceAreaDao;
	}

	// 添加通知
	public boolean add(AnnounceDomain announceDomain) {
		return announceAreaDao.add(announceDomain);
	}

	// 按标题获取通知
	public List<AnnounceDomain> getAnnounceByTitle(String title) {

		List<AnnounceDomain> list = null;
		list = announceAreaDao.getAnnounceByTitle(title);
		return list;
	}

	// 按标题，删除通知
	public Boolean deleteAnnounce(String title) {
		return announceAreaDao.deleteAnnounce(title);
	}

	// 获取前5个通知
	public List<AnnounceDomain> get_5_AnnounceTitle() {
		return announceAreaDao.get_5_AnnounceTitle();
	}

	// 获取所有的标题
	public List<AnnounceDomain> getAllTitle() {
		return announceAreaDao.getAllTitle();
	}

	// 保存静态网页的信息
	public boolean saveHtmlInfo(String title, String htmlPath,
			String StaticHtmlName) {
		return announceAreaDao.saveHtmlInfo(title, htmlPath, StaticHtmlName);
	}

	// 获取总结果数
	public int getTotalResult() {
		return announceAreaDao.getTotalResult();
	}

	// 通知分页
	public List<AnnounceDomain> getPagingResult(int firstResult, int maxResult) {
		return announceAreaDao.getPagingResult(firstResult, maxResult);
	}

}
