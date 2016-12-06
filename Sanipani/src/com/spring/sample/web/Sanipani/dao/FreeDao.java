package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class FreeDao implements IFreeDao{
	@Autowired
	public SqlMapClient sqlMapClient;
	
	@Override
	public int getFreeBoardCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("FreeBoard.getFreeBoardCount",params);
	}
	
	@Override
	public int getFreeRepleCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("FreeBoard.getFreeBoardRepleCount",params);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getFreeBoard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("FreeBoard.getFreeBoard", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getFreeReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("FreeBoard.getFreeReple", params);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getFreeBoardCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("FreeBoard.getFreeBoardCon",params);
	}
	
	@Override
	public String FreeBoardAdd(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		
		
		try{
			sqlMapClient.insert("FreeBoard.FreeBoardAdd", params);
			
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
	public String FreeRepleAdd(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction(); // Transaction실행.
		sqlMapClient.startBatch(); //Batch 여러개의 (대용량 10만건등등)을 할때 이걸 사용하는게 좋음.
								   // Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(오라클에게 작업을 늘림)
									// startBatch 와 executeBatch사이의 쿼리문을 모았다가 한번에 다날림
		try{
			sqlMapClient.insert("FreeBoard.FreeBoardRepleAdd", params);
			
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
	public int updateFreeBoard(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("FreeBoard.FreeBoardMod", params);
	}

	
	@Override
	public int DeleteFreeBoard(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("FreeBoard.DeleteFreeBoard", params);
	}

	@Override
	public int FreeBoardLookUp(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("FreeBoard.FreeBoardLookup", params);
	}

	@Override
	public int RepleDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlMapClient.update("FreeBoard.DeleteReple", params);
	}




	
	
}
