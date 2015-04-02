package com.uploadphoto.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernateUtil.HibernateUtil;
import com.uploadphoto.domain.UploadPhoto;

public class UploadPhotoDao {

	public UploadPhotoDao() {
	}

	// 获取SessionFactory
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	// 添加新闻
	public boolean add(UploadPhoto uploadPhoto) {
		Transaction transaction = null;
		Session session = null;
		boolean isOk = false;
		try {
			//
			session = sessionFactory.openSession();
			//
			session.save(uploadPhoto);
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

	// 按图片名称获取图片对象
	public List<UploadPhoto> getPhotoObjectByPhotoName(String photoName) {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM UploadPhoto where photoName='" + photoName + "'";
		List<UploadPhoto> list = null;

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
			//System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// 获取所有的图片对象
	public List<UploadPhoto> getAllPhotoObject() {

		Transaction transaction = null;
		Session session = null;
		String sql = "FROM UploadPhoto ORDER BY fullTime DESC";
		List<UploadPhoto> list = null;

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
			//System.out.println("按标题获取新闻出错 ！！！");
		} finally {
			session.close();
		}
		// System.out.println(list);
		return list;
	}

	// 按照片名称，删除图片记录
	public Boolean deletePhotoRecordByPhotoName(String photoName) {

		Transaction transaction = null;
		Session session = null;
		String sql = "DELETE UploadPhoto where photoName='" + photoName + "'";
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
					.createQuery("SELECT COUNT(*) FROM UploadPhoto")
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


}
