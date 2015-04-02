package com.login.service;

import com.login.dao.LoginInfoDao;

public class LoginInfoService {

	private LoginInfoDao loginInfoDao;

	public LoginInfoDao getLoginInfoDao() {
		return loginInfoDao;
	}

	public void setLoginInfoDao(LoginInfoDao loginInfoDao) {
		this.loginInfoDao = loginInfoDao;
	}

	public boolean getResult(String username, String password) {

		return loginInfoDao.getResult(username, password);
	}
}
