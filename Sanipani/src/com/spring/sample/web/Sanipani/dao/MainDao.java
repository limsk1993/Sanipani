package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class MainDao implements IMainDao{
	@Autowired
	public SqlMapClient sqlMapClient;
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Mainpage.getMem",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getNotice(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Mainpage.getNotice", params);
	}

	@Override
	public int getNoticeCount(HashMap<String, String> params) throws Throwable {
		return (int) sqlMapClient.queryForObject("Mainpage.getNoticeCount", params);
	}
}
