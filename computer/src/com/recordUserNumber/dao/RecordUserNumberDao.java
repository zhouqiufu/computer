package com.recordUserNumber.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.DynamicNewsArea.domain.DynamicNewsArea;
import com.hibernateUtil.HibernateUtil;
import com.recordUserNumber.domain.RecordUserNumber;

public class RecordUserNumberDao {

	public RecordUserNumberDao() {
	}

	// 获取SessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// 添加
	public boolean add(RecordUserNumber recordUserNumber) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(recordUserNumber);
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
					.createQuery("SELECT COUNT(*) FROM RecordUserNumber")
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

	// 按年份查询浏览量

	public int getYearTotalResult(String year) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM RecordUserNumber where loginTime like '" + year
				+ "-" + "%" + "'";
		List<RecordUserNumber> list = null;
		int i = 0;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//
			list = query.list();
			i = list.size();
			System.out.println(i);
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
		return i;
	}

	// 查询某月的浏览量
	public int getMonthTotalResult(String month, String year) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM RecordUserNumber where loginTime like '" + year
				+ "-" + month + "-" + "%" + "'";
		List<RecordUserNumber> list = null;
		int i = 0;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//
			list = query.list();
			i = list.size();
			System.out.println(i);
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
		return i;
	}

	// 查询当日的浏览量
	public int getDayTotalResult(String day, String month, String year) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM RecordUserNumber where loginTime like '" + year
				+ "-" + month + "-" + day + "%" + "'";
		List<RecordUserNumber> list = null;
		int i = 0;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//
			list = query.list();
			i = list.size();
			System.out.println(i);
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
		return i;
	}

}
