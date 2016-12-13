package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IMainDao;

@Service
public class MainService implements IMainService{
	  @Autowired
	   public IMainDao iMainDao;
	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getMem(params);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> getNotice(HashMap<String, String> params) throws Throwable {
		return iMainDao.getNotice(params);
	}

	@Override
	public int getNoticeCount(HashMap<String, String> params) throws Throwable {
		return iMainDao.getNoticeCount(params);
	}

	@Override
	public HashMap<String, String> getNoticeCon(HashMap<String, String> params) throws Throwable {
		return iMainDao.getNoticeCon(params);
	}

	@Override
	public int deleteNotice(HashMap<String, String> params) throws Throwable {
		return iMainDao.deleteNotice(params);
	}

	@Override
	public int updateNotice(HashMap<String, String> params) throws Throwable {
		return iMainDao.updateNotice(params);
	}

	@Override
	public String insertNotice(HashMap<String, String> params) throws Throwable {
		return iMainDao.insertNotice(params);
	}
}
