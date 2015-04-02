package com.uploadphoto.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.uploadphoto.dao.UploadPhotoDao;
import com.uploadphoto.domain.UploadPhoto;

public class UploadPhotoService {
	public UploadPhotoService() {
	}

	public UploadPhotoDao getUploadPhotoDao() {
		return uploadPhotoDao;
	}

	public void setUploadPhotoDao(UploadPhotoDao uploadPhotoDao) {
		this.uploadPhotoDao = uploadPhotoDao;
	}

	private UploadPhotoDao uploadPhotoDao;

	// 添加新闻
	public boolean add(UploadPhoto uploadPhoto) {
		return uploadPhotoDao.add(uploadPhoto);
	}

	// 按图片名称获取图片对象
	public List<UploadPhoto> getPhotoObjectByPhotoName(String photoName) {
		return uploadPhotoDao.getPhotoObjectByPhotoName(photoName);
	}

	// 获取所有的图片对象
	public List<UploadPhoto> getAllPhotoObject() {
		return uploadPhotoDao.getAllPhotoObject();
	}

	// 按照片名称，删除图片记录
	public Boolean deletePhotoRecordByPhotoName(String photoName) {
		return uploadPhotoDao.deletePhotoRecordByPhotoName(photoName);
	}

	// 获取总结果数
	public int getTotalResult() {
		return uploadPhotoDao.getTotalResult();
	}

}
