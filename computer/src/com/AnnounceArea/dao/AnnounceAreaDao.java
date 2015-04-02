package com.AnnounceArea.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.AnnounceArea.domain.AnnounceDomain;
import com.DynamicNewsArea.domain.DynamicNewsArea;
import com.hibernateUtil.HibernateUtil;

public class AnnounceAreaDao {

	public AnnounceAreaDao() {
	}

	// 获取SessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// 添加通知
	public boolean add(AnnounceDomain announceDomain) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(announceDomain);
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();
			//
			isOk = true;

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			isOk = false;

		} finally {
			session.close();
		}
		return isOk;
	}

	// 按标题获取对应的通知
	public List<AnnounceDomain> getAnnounceByTitle(String title) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM AnnounceDomain where announceTitle='" + title + "'";
		List<AnnounceDomain> list = null;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//
			list = query.list();
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			// System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// 获取前5个通知
	public List<AnnounceDomain> get_5_AnnounceTitle() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM AnnounceDomain ORDER BY fullTime DESC";
		List<AnnounceDomain> list = null;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			query.setFirstResult(0);
			query.setMaxResults(5);
			//
			list = query.list();
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			// System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// 按标题，删除通知
	public Boolean deleteAnnounce(String title) {

		Transaction transaction = null;
		Session session = null;
		String sql = "DELETE AnnounceDomain where announceTitle='" + title
				+ "'";
		Boolean isOk = false;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//
			int i = query.executeUpdate();
			if (i != 0) {

				isOk = true;
			}
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			// System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return isOk;
	}

	// 保存静态网页的信息
	public boolean saveHtmlInfo(String title, String htmlPath,
			String StaticHtmlName) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session
					.createQuery("update AnnounceDomain set html_path='"
							+ htmlPath + "',htmlName='" + StaticHtmlName
							+ "' where announceTitle='" + title + "'");
			int i = query.executeUpdate();
			if (i != 0) {
				isOk = true;
			}
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();
			//

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			isOk = false;

		} finally {
			session.close();
		}
		return isOk;
	}

	// 获取所有的标题
	public List<AnnounceDomain> getAllTitle() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM AnnounceDomain";
		List<AnnounceDomain> list = null;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			// query.setFirstResult(0);
			// query.setMaxResults(13);
			//
			list = query.list();
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// 获取总结果数
	public int getTotalResult() {
		Transaction transaction = null;
		Session session = null;
		int i = -1;
		try {
			//
			session = sessionFactory.openSession();
			//
			i = Integer.parseInt(session
					.createQuery("SELECT COUNT(*) FROM AnnounceDomain")
					.uniqueResult().toString());
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();

		} catch (Exception e) {
			//
			transaction.rollback();

		} finally {
			session.close();
		}
		return i;
	}

	// 通知分页
	public List<AnnounceDomain> getPagingResult(int firstResult, int maxResult) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM AnnounceDomain ORDER BY fullTime DESC";
		List<AnnounceDomain> list = null;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			//
			list = query.list();
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

}
