package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ReportDao implements IReportDao {

	@Autowired
	public SqlMapClient sqlMapClient;

	@Override
	public int getReportCount(HashMap<String, String> params) throws Throwable {
		return (int) sqlMapClient.queryForObject("ReportBoard.getReportCount", params);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getReport(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("ReportBoard.getReport", params);
	}


	
	
}
