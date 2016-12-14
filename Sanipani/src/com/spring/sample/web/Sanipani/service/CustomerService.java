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


	@Override
	public int Cusreply(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCusreply(params);
	}


	@Override
	public int getRefundlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getRefundlist(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getRefund(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getRefund(params);
	}


	@Override
	public int getCalllist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCalllist(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getCall(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCall(params);
	}


	@Override
	public int getCouponlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCouponlist(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getCoupon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCoupon(params);
	}


	@Override
	public int getServicelist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getServicelist(params);
	}


	@Override
	public ArrayList<HashMap<String, String>> getService(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getService(params);
	}


	@Override
	public int QnAlookup(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getQnAlookup(params);
	}


	@Override
	public int Cuslookup(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCustomerDao.getCuslookup(params);
	}
	
}
