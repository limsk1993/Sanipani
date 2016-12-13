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

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getNoticeCon(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapClient.queryForObject("Mainpage.getNoticeCon", params);
	}

	@Override
	public int deleteNotice(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("Mainpage.deleteNotice", params);
	}

	@Override
	public int updateNotice(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("Mainpage.updateNotice", params);
	}

	@Override
	public String insertNotice(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction();
		sqlMapClient.startBatch();
		
		try {
			sqlMapClient.insert("Mainpage.insertNotice", params);
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction();
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res;
	}
}
