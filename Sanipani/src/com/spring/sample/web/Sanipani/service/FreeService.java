package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IFreeDao;

@Service
public class FreeService implements IFreeService{
	  @Autowired
	   public IFreeDao iMainDao;
	  
	@Override
	public int getFreeBoardCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getFreeBoardCount(params);
	}
	@Override
	public int getFreeRepleCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getFreeRepleCount(params);
	}
	
	
	@Override
	public ArrayList<HashMap<String, String>> getFreeBoard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getFreeBoard(params);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> getFreeReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getFreeReple(params);
	}
	
	@Override
	public HashMap<String, String> getFreeBoardCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.getFreeBoardCon(params);
	}
	@Override
	public String FreeBoardAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.FreeBoardAdd(params);
	}
	@Override
	public String FreeRepleAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.FreeRepleAdd(params);
	}
	
	@Override
	public int updateFreeBoard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.updateFreeBoard(params);
	}
	
	@Override
	public int DeleteFreeBoard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.DeleteFreeBoard(params);
	}
	@Override
	public int FreeBoardLookUp(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMainDao.FreeBoardLookUp(params);
	}
	
	@Override
	public int RepleDelete(HashMap<String, String> params) throws Throwable {
		
		return iMainDao.RepleDelete(params);
	}


	
}
