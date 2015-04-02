package com.TechnologyArea.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.DynamicNewsArea.domain.DynamicNewsArea;
import com.TechnologyArea.domain.TechnologyArea;
import com.hibernateUtil.HibernateUtil;

public class TechnologyAreaDao {

	public TechnologyAreaDao() {
	}

	// 获取SessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// 添加技术文章
	public boolean add(TechnologyArea technologyArea) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(technologyArea);
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

	// 获取所有的标题
	public List<TechnologyArea> getAllTitle() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM TechnologyArea";
		List<TechnologyArea> list = null;

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
			//System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// 按标题获取对应的技术文章的标题
	public List<TechnologyArea> getTechnologyByTitle(String title) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM TechnologyArea where technologyTitle='" + title
				+ "'";
		List<TechnologyArea> list = null;

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

	// 获取前11个标题
	public List<TechnologyArea> get_11_technologyTitle() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM TechnologyArea ORDER BY fullTime DESC";
		List<TechnologyArea> list = null;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			query.setFirstResult(0);
			query.setMaxResults(13);
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

	// 按标题，删除技术文章
	public Boolean deleteTechnologyArticle(String title) {

		Transaction transaction = null;
		Session session = null;
		String sql = "DELETE TechnologyArea where technologyTitle='" + title
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
					.createQuery("update TechnologyArea set html_path='"
							+ htmlPath + "',htmlName='" + StaticHtmlName
							+ "' where technologyTitle='" + title + "'");
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
					.createQuery("SELECT COUNT(*) FROM TechnologyArea")
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

	// 新闻分页
	public List<TechnologyArea> getPagingResult(int firstResult, int maxResult) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM TechnologyArea ORDER BY fullTime DESC";
		List<TechnologyArea> list = null;

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
			// System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

}
