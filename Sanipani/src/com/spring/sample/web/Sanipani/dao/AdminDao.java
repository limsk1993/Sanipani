package com.spring.sample.web.Sanipani.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class AdminDao implements IAdminDao{
	@Autowired
	public SqlMapClient sqlMapClient;
		
	@Override
	public int getMemberInfoCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("spAdmin.MemberInfoCount",params);
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getMemberInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("spAdmin.MemberInfo", params);
	}


<<<<<<< HEAD
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getMemberInfoCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("spAdmin.MemberInfoLook",params);
	}


	@Override
	public int MemberGradeNum(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlMapClient.update("spAdmin.MemberInfoFix", params);
	}


=======
>>>>>>> branch 'master' of https://github.com/limsk1993/Sanipani
	@Override
	public int getAdminMoneyPage(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("spAdmin.getAdminMoneyPage",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getAdminMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("spAdmin.getAdminMoney",params);
	}


	@Override
	public void insertMoneyRefund(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("spAdmin.insertMoneyRefund",params);
	}

}
