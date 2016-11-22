package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class AuctionDao implements IAuctionDao {

	@Autowired
	public SqlMapClient sqlMapClient;
	
	@Override
	public int getAuctionCount(HashMap<String, String> params) throws Throwable {
		return (int) sqlMapClient.queryForObject("AuctionBoard.getAuctionCount", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getAuction(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("AuctionBoard.getAuction", params);
	}

	@Override
	public String insertAuction(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction();
		sqlMapClient.startBatch();
		
		try {
			sqlMapClient.insert("AuctionBoard.insertAuction", params);
			
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

	@Override
	public int deleteAuction(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.delete("AuctionBoard.deleteAuction", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getAuctionCon(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapClient.queryForObject("AuctionBoard.getAuctionCon", params);
	}

}
