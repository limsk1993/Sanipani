package com.spring.sample.web.Sanipani.service;

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

}
