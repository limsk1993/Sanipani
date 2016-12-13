package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IAdminDao;



@Service
public class AdminService implements IAdminService{
	  @Autowired
	   public IAdminDao iMainDao;
	
	
	@Override
	public int getMemberInfoCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getMemberInfoCount(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getMemberInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getMemberInfo(params);
	}

	
	@Override
	public HashMap<String, String> getMemberInfoCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getMemberInfoCon(params);
	}


	@Override
	public int MemberGradeNum(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.MemberGradeNum(params);
	}

}
