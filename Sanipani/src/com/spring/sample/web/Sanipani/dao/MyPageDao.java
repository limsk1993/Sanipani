package com.spring.sample.web.Sanipani.dao;



import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class MyPageDao implements IMyPageDao{
	@Autowired
	public SqlMapClient sqlMapClient;

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getFreeBoardCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("spMypage.userInfo",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> MyPageDeTail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("spMypage.userInfo", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> UserInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("spMypage.userChange",params);
	}

	@Override
	public int updateUserInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlMapClient.update("spMypage.ChangeMemberInfo", params);
	}

	
	@Override
	public int MemberBye(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlMapClient.delete("spMypage.member",params);
	}
	
	@SuppressWarnings("unchecked")
	   @Override
	   public HashMap<String, String> userPw(HashMap<String, String> params) throws Throwable {
	      // TODO Auto-generated method stub
	      return (HashMap<String, String>) sqlMapClient.queryForObject("spMypage.userPw",params);
	   }

	   @Override
	   public int getPwUpdate(HashMap<String, String> params) throws Throwable {
	      // TODO Auto-generated method stub
	      return (int) sqlMapClient.update("spMypage.getPwUpdate",params);
	   }

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> MemberCheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("spMypage.userByeCheck",params);
	}
		
	

}
