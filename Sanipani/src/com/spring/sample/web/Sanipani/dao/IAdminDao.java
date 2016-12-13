package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IAdminDao {

	public int getMemberInfoCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getMemberInfo(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMemberInfoCon(HashMap<String, String> params) throws Throwable;

	public int MemberGradeNum(HashMap<String, String> params) throws Throwable;

	public int getAdminMoneyPage(HashMap<String, String> params) throws Throwable;
	
	public ArrayList<HashMap<String, String>> getAdminMoney(HashMap<String, String> params) throws Throwable;

	public void insertMoneyRefund(HashMap<String, String> params) throws Throwable;

	

}
