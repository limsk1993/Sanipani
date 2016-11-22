package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class TradeDao implements ITradeDao {
	@Autowired
	public SqlMapClient sqlMapClient;

	@Override
	public int getTradeCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Tradepage.getTradeCount",params);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTradeBoard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Tradepage.getTradeBoard",params);
	}
	

}
