package com.maintain.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernateUtil.HibernateUtil;
import com.leaveMessage.domain.LeaveMessage;
import com.maintain.domain.Maintain;

public class MaintainDao {

	public MaintainDao() {
	}

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	public boolean add(Maintain maintain) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(maintain);
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

	public int getTotalResult() {
		Transaction transaction = null;
		Session session = null;
		int i = -1;
		try {
			//
			session = sessionFactory.openSession();
			//
			i = Integer.parseInt(session
					.createQuery("SELECT COUNT(*) FROM Maintain")
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

	// 获取全部
	public List<Maintain> getAllMaintains() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM Maintain ORDER BY dateTime DESC";
		List<Maintain> list = null;

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

	// 删除
	public boolean deleteMaintain(String name, String dateTime) {

		Transaction transaction = null;
		Session session = null;
		String sql = "DELETE FROM Maintain where name='" + name
				+ "' and dateTime='" + dateTime + "'";
		boolean isOk = false;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			int i = query.executeUpdate();
			//
			transaction = session.beginTransaction();
			//
			transaction.commit();
			if (i != 0) {
				isOk = true;
			}

		} catch (Exception e) {
			//
			transaction.rollback();
			//
			isOk = false;
		} finally {
			session.close();
		}
		// System.out.println(list);
		return isOk;
	}

}
