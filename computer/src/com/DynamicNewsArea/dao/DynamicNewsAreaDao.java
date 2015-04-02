package com.DynamicNewsArea.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.DynamicNewsArea.domain.DynamicNewsArea;
import com.hibernateUtil.HibernateUtil;

public class DynamicNewsAreaDao {

	public DynamicNewsAreaDao() {
	}

	// ��ȡSessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// �������
	public boolean add(DynamicNewsArea dynamicNewsArea) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(dynamicNewsArea);
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

	// �������ȡ��Ӧ������
	public List<DynamicNewsArea> getNewsByTitle(String title) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM DynamicNewsArea where newsTitle='" + title + "'";
		List<DynamicNewsArea> list = null;

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
			System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// ��ȡǰ13������
	public List<DynamicNewsArea> get_13_newsTitle() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM DynamicNewsArea ORDER BY fullTime DESC";
		List<DynamicNewsArea> list = null;

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
			System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// ��ȡ���е����ű���
	public List<DynamicNewsArea> getAllNewsTitle() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM DynamicNewsArea";
		List<DynamicNewsArea> list = null;

		try {
			//
			session = sessionFactory.openSession();
			//
			Query query = session.createQuery(sql);
			//query.setFirstResult(0);
			//query.setMaxResults(13);
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
			System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// �����⣬ɾ������
	public Boolean deleteNews(String title) {

		Transaction transaction = null;
		Session session = null;
		String sql = "DELETE DynamicNewsArea where newsTitle='" + title + "'";
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
			// System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return isOk;
	}

	// ���澲̬��ҳ����Ϣ
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
					.createQuery("update DynamicNewsArea set html_path='"
							+ htmlPath + "',htmlName='" + StaticHtmlName
							+ "' where newsTitle='" + title + "'");
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

	// ��ȡ�ܽ����
	public int getTotalResult() {
		Transaction transaction = null;
		Session session = null;
		int i = -1;
		try {
			//
			session = sessionFactory.openSession();
			//
			i = Integer.parseInt(session
					.createQuery("SELECT COUNT(*) FROM DynamicNewsArea")
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

	// ���ŷ�ҳ
	public List<DynamicNewsArea> getPagingResult(int firstResult, int maxResult) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM DynamicNewsArea ORDER BY fullTime DESC";
		List<DynamicNewsArea> list = null;

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
			System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

}
