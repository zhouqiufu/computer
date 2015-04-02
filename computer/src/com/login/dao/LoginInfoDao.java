package com.login.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.DynamicNewsArea.domain.DynamicNewsArea;
import com.hibernateUtil.HibernateUtil;
import com.login.domain.LoginInfo;

public class LoginInfoDao {

	// 获取SessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// 匹配
	public boolean getResult(String username, String password) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM LoginInfo where username='" + username
				+ "'and password='" + password + "'";

		boolean isLogin = false;
		
		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//
			if (query.list().size() == 1) {
				isLogin = true;
			}
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
		// System.out.println(list);
		return isLogin;
	}

}
