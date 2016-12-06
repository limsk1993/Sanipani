package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.sample.web.Sanipani.dao.ICustomerDao;


@Service
public class CustomerService implements ICustomerService {

	@Autowired
	public  ICustomerDao iCustomerDao;
	
	@Override
	public int getTempCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getTempCount(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getTemp(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getTemp(params);
	}


	@Override
	public int getTempCount2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getTempCount2(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getTemp2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getTemp2(params);
	}


	@Override
	public HashMap<String, String> getCusdetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCusdetail(params);
	}


	@Override
	public HashMap<String, String> getQnAdetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnAdetail(params);
	}


	@Override
	public int QnAupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnAupdate(params);
	}


	@Override
	public HashMap<String, String> getQnAlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnAlist(params);
	}


	@Override
	public int getQnAlister(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnAlister(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getTemp3(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getTemp3(params);
	}


	@Override
	public int getQnABoarder(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnABoarder(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getTemp4(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getTemp4(params);
	}


	@Override
	public String QnAinsert(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.QnAinsert(params);
	}


	@Override
	public String Cusinsert(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.Cusinsert(params);
	}


	@Override
	public HashMap<String, String> getQnAdetail1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnAdetail1(params);
	}


	@Override
	public int QnAdelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		 return iCustomerDao.getQnAdelete(params);
	}


	@Override
	public int Cusupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCusupdate(params);
	}


	@Override
	public int Cusdelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCusdelete(params);
	}
	
}
