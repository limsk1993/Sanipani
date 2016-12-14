package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;





public interface ICustomerService {



	public ArrayList<HashMap<String, String>> getTemp(HashMap<String, String> params) throws Throwable;

	public int getTempCount(HashMap<String, String> params) throws Throwable;

	public int getTempCount2(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp2(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCusdetail(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQnAdetail(HashMap<String, String> params) throws Throwable;

	public int QnAupdate(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQnAlist(HashMap<String, String> params) throws Throwable;

	public int getQnAlister(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp3(HashMap<String, String> params) throws Throwable;

	public int getQnABoarder(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp4(HashMap<String, String> params)throws Throwable;

	public String QnAinsert(HashMap<String, String> params) throws Throwable;

	public String Cusinsert(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQnAdetail1(HashMap<String, String> params) throws Throwable;

	public int QnAdelete(HashMap<String, String> params) throws Throwable;

	public int Cusupdate(HashMap<String, String> params) throws Throwable;

	public int Cusdelete(HashMap<String, String> params) throws Throwable;

	public int Cusreply(HashMap<String, String> params) throws Throwable;

	public int getRefundlist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getRefund(HashMap<String, String> params) throws Throwable;

	public int getCalllist(HashMap<String, String> params)throws Throwable;

	public ArrayList<HashMap<String, String>> getCall(HashMap<String, String> params) throws Throwable;

	public int getCouponlist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getCoupon(HashMap<String, String> params) throws Throwable;

	public int getServicelist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getService(HashMap<String, String> params) throws Throwable;

	public int QnAlookup(HashMap<String, String> params) throws Throwable;

	public int Cuslookup(HashMap<String, String> params) throws Throwable;




	
	

}
