package com.spring.sample.web.Sanipani.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IMyPageDao;

@Service
public class MyPageService implements IMyPageService{

	 @Autowired
	   public IMyPageDao iMainDao;

	@Override
	public HashMap<String, String> getFreeBoardCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getFreeBoardCon(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> MyPageDeTail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.MyPageDeTail(params);
	}

	@Override
	public HashMap<String, String> UserInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.UserInfo(params);
	}

	@Override
	public int updateUserInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.updateUserInfo(params);
	}
	
	@Override
	public int MemberBye(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.MemberBye(params);
	}
	
	@Override
	   public HashMap<String, String> userPw(HashMap<String, String> params) throws Throwable {
	      // TODO Auto-generated method stub
	      return iMainDao.userPw(params);
	   }

	   @Override
	   public int PwUpdate(HashMap<String, String> params) throws Throwable {
	      // TODO Auto-generated method stub
	      return iMainDao.getPwUpdate(params);
	   }

	@Override
	public HashMap<String, String> MemberCheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.MemberCheck(params);
	}

}
