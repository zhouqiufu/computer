package com.hibernateUtil;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class HibernateUtil {

	public static SessionFactory sessionFactory;

	static {
		//
		Configuration cfg = new Configuration();

		//
		cfg.configure("hibernate.cfg.xml");

		//
		sessionFactory = cfg.buildSessionFactory();

	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

}
