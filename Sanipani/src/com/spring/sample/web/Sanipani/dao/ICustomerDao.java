package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ICustomerDao {

	public int getTempCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp(HashMap<String, String> params) throws Throwable;

	public int getTempCount2(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp2(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCusdetail(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQnAdetail(HashMap<String, String> params) throws Throwable;

	public int getQnAupdate(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQnAlist(HashMap<String, String> params) throws Throwable;

	public int getQnAlister(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp3(HashMap<String, String> params)throws Throwable;

	public int getQnABoarder(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTemp4(HashMap<String, String> params) throws Throwable;

	public String QnAinsert(HashMap<String, String> params) throws Throwable;

	public String Cusinsert(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQnAdetail1(HashMap<String, String> params) throws Throwable;

	public int getQnAdelete(HashMap<String, String> params) throws Throwable;

	public int getCusupdate(HashMap<String, String> params) throws Throwable;

	public int getCusdelete(HashMap<String, String> params) throws Throwable;

	public int getCusreply(HashMap<String, String> params) throws Throwable;

	public int getRefundlist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getRefund(HashMap<String, String> params) throws Throwable;

	public int getCalllist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getCall(HashMap<String, String> params) throws Throwable;

	public int getCouponlist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getCoupon(HashMap<String, String> params) throws Throwable;

	public int getServicelist(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getService(HashMap<String, String> params) throws Throwable;

	public int getQnAlookup(HashMap<String, String> params) throws Throwable;

	public int getCuslookup(HashMap<String, String> params) throws Throwable;

}
