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

	// ��ȡSessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// ���֪ͨ
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

	// �������ȡ��Ӧ��֪ͨ
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
			// System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// ��ȡǰ5��֪ͨ
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
			// System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// �����⣬ɾ��֪ͨ
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

	// ��ȡ���еı���
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
			System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
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

	// ֪ͨ��ҳ
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
			System.out.println("�������ȡ���ų��� ������");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

}
