package com.leaveMessage.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernateUtil.HibernateUtil;
import com.leaveMessage.domain.LeaveMessage;

public class LeaveMessageDao {

	public LeaveMessageDao() {
	}

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	public boolean add(LeaveMessage leaveMessage) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(leaveMessage);
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
					.createQuery("SELECT COUNT(*) FROM LeaveMessage")
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

	// 获取全部留言
	public List<LeaveMessage> getAllMessages() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM LeaveMessage ORDER BY dateTime DESC";
		List<LeaveMessage> list = null;

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

	// 删除留言
	public boolean deleteMessage(String name,String dateTime) {

		Transaction transaction = null;
		Session session = null;
		String sql = "DELETE FROM LeaveMessage where name='"+name+"' and dateTime='"+dateTime+"'";
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
			if(i!=0){
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
