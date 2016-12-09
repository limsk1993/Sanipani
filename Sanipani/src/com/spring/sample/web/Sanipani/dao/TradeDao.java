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

	@Override
	public String insertTrade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
	String res = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.insert("Tradepage.insertTrade", params);
			
			sqlMapClient.executeBatch(); 
			sqlMapClient.commitTransaction(); // Transaction적용
			
			res = "true";
		} catch(Exception e){
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res;
	}

	@Override
	public String insertTrade1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		String res1 = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.insert("Tradepage.insertTrade1", params);
			
			sqlMapClient.executeBatch(); 
			sqlMapClient.commitTransaction(); // Transaction적용
			
			res1 = "true";
		} catch(Exception e){
			res1 = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res1;
	}

	@Override
	public int getTradeNo() throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Tradepage.getTradeNo");
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getTradeCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getTradeCon",params);
	}

	@Override
	public String insertTrade2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		String res2 = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.insert("Tradepage.insertTrade2", params);
			
			sqlMapClient.executeBatch(); 
			sqlMapClient.commitTransaction(); // Transaction적용
			
			res2 = "true";
		} catch(Exception e){
			res2 = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res2;
	}

	@Override
	public void getTradereple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.update("Tradepage.getTradereple",params);
	}

	@Override
	public void deleteTrade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.update("Tradepage.deleteTrade",params);	
	}

	@Override
	public String updateTrade1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		
		String res = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.update("Tradepage.updateTrade1",params);
			
			sqlMapClient.executeBatch(); 
			sqlMapClient.commitTransaction(); // Transaction적용
			
			res = "true";
		} catch(Exception e){
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res;
		
	}

	@Override
	public String updateTrade2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		
		String res1 = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.update("Tradepage.updateTrade2",params);
			
			sqlMapClient.executeBatch(); 
			sqlMapClient.commitTransaction(); // Transaction적용
			
			res1 = "true";
		} catch(Exception e){
			res1 = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res1;
	}

	@Override
	public String insertEscrow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		String res = "false";
		
		
		
		try{
			sqlMapClient.insert("Tradepage.insertEscrow", params);
			
			res = "true";
		} catch(Exception e){
			res = "false";
			
		}
		
	
		
		return res;
	}
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getTradeUser1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getTradeUser1",params);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getTradeUser2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getTradeUser2",params);
	}

	@Override
	public String updateStatus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		String buy = "false";
		
		
		
		try{
			sqlMapClient.update("Tradepage.updateStatus",params);
			
			buy = "true";
		} catch(Exception e){
			buy = "false";
			
		}
		return buy;
	}

	@Override
	public String updateStatus1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
	String sell = "false";
		
		
		
		try{
			sqlMapClient.update("Tradepage.updateStatus1",params);
			
			sell = "true";
		} catch(Exception e){
			sell = "false";
			
		}
		return sell;
	}
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getStatus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getStatus",params);
	}

	@Override
	public int getStatusNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Tradepage.getStatusNo",params);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getTradeStatus1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getTradeStatus1",params);
	}

	

	@Override
	public void insertMoneyStatus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("Tradepage.insertMoneyStatus",params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public int getTradeTotal1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Tradepage.getTradeTotal1",params);
	}

	@Override
	public String DeliveryUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
	String res = "false";
		
		
		
		try{
			sqlMapClient.update("Tradepage.DeliveryUpdate", params);
			
			res = "true";
		} catch(Exception e){
			res = "false";
			
		}
		
	
		
		return res;
	}
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getTradeDelivery(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getTradeDelivery",params);
	}

	@Override
	public void CompleteUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.update("Tradepage.CompleteUpdate",params);
	}

	@Override
	public Long getTradeUserNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (Long) sqlMapClient.queryForObject("Tradepage.getTradeUserNo",params);
	}

	@Override
	public void MoneyUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("Tradepage.MoneyUpdate",params);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getTradeCon1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getTradeCon1",params);
	}

	@Override
	public void insertBuyerMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("Tradepage.insertBuyerMoney",params);
	}

	@Override
	public void updateStar(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.update("Tradepage.updateStar",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getStarCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getStarCount",params);
	}

	@Override
	public void updateRank1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.update("Tradepage.updateRank1",params);
	}

	@Override
	public void TradeCencelDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.delete("Tradepage.TradeCencelDel",params);
	}

	@Override
	public void TradeOtherDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.delete("Tradepage.TradeOtherDel",params);
	}

	@Override
	public void insertReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("Tradepage.insertReple",params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getshowReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Tradepage.getshowReple", params);
	}

	@Override
	public void updateDelReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient .update("Tradepage.updateDelReple",params);
		
	}

	@Override
	public String insertReport(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
	String res = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.update("Tradepage.insertReport",params);
			
			sqlMapClient.executeBatch(); 
			sqlMapClient.commitTransaction(); // Transaction적용
			
			res = "true";
		} catch(Exception e){
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res;
	}

	
	
	///////////////////////Auction
	@Override
	public void EscrowUpdateAuction(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.update("Tradepage.EscrowUpdateAuction",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getStatusAuction(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getStatusAuction",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getStatusBuyer(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getStatusBuyer",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getAuctionSeller(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Tradepage.getAuctionSeller",params);
	}





	
	
	
	

}
