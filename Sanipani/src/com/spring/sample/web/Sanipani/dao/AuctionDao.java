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
		return sqlMapClient.update("AuctionBoard.deleteAuction", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getAuctionCon(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapClient.queryForObject("AuctionBoard.getAuctionCon", params);
	}

	@Override
	public String insertAuctionPicture(HashMap<String, String> params) throws Throwable {
		String respicture = "false";
		
		sqlMapClient.startTransaction();
		sqlMapClient.startBatch();
		
		try {
			sqlMapClient.insert("AuctionBoard.insertAuctionPicture", params);
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction();
			
			respicture = "true";
		} catch (Exception e) {
			respicture = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return respicture;
	}

	@Override
	public int getAuctionNo() throws Throwable {
		return (int) sqlMapClient.queryForObject("AuctionBoard.getAuctionNo");
	}

	@Override
	public int updateAuction(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("AuctionBoard.updateAuction", params);
	}

	@Override
	public String updateAuctionPriceRegist(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction(); // 트렌젝션 시작
		sqlMapClient.startBatch(); // 배치 적용
		
		try {
			sqlMapClient.insert("AuctionBoard.updateAuctionPriceRegist", params); // select만 queryForList나 Object이다. 나머지는 insert, update, delete
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction(); // 트렌젝션 완료
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction(); // 트렌젝션 종료
		
		return res;
	}

	@Override
	public int updateAuctionPriceCancel(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.delete("AuctionBoard.updateAuctionPriceCancel", params);
	}

	@Override
	public int updateAuctionAddDate(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("AuctionBoard.updateAuctionAddDate", params);
	}

	@Override
	public int updateAuctionEnd(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("AuctionBoard.updateAuctionEnd", params);
	}

	@Override
	public int updateAuctionEnd2(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("AuctionBoard.updateAuctionEnd2", params);
	}

	@Override
	public int updateAuctionLookup(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("AuctionBoard.updateAuctionLookup", params);
	}

	@Override
	public int deleteNotAuctionMember(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.delete("AuctionBoard.deleteNotAuctionMember", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getshowReply(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("AuctionBoard.getshowReply", params);
	}

	@Override
	public void insertAuctionReply(HashMap<String, String> params) throws Throwable {
		sqlMapClient.insert("AuctionBoard.insertAuctionReply", params);
	}

	@Override
	public int deleteAuctionReply(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("AuctionBoard.deleteAuctionReply", params);
	}

	@Override
	public void reportAuctionReply(HashMap<String, String> params) throws Throwable {
		sqlMapClient.insert("AuctionBoard.reportAuctionReply", params);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getAuctionCon1(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>) sqlMapClient.queryForObject("AuctionBoard.getAuctionCon1", params);
	}

	@Override
	public void insertAuctionTotal(HashMap<String, String> params) throws Throwable {
		sqlMapClient.insert("AuctionBoard.insertAuctionTotal", params);
	}

	@Override
	public void insertAuctionTotal2(HashMap<String, String> params) throws Throwable {
		sqlMapClient.insert("AuctionBoard.insertAuctionTotal2", params);
	}
}
