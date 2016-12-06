package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class CustomerDao implements ICustomerDao {
	
	@Autowired
	public SqlMapClient sqlMapClient;
	
	@Override
	public int getTempCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Customer.getTempCount",params);
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTemp(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Customer.getTemp",params);
	}


	@Override
	public int getTempCount2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		 return (int) sqlMapClient.queryForObject("Customer.getTempCount2",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTemp2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Customer.getTemp2",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getCusdetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Customer.getCusdetail",params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getQnAdetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Customer.getQnAdetail",params);
	}

	@Override
	public int getQnAupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.update("Customer.getQnAupdate",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getQnAlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Customer.getQnAlist",params);
	}


	@Override
	public int getQnAlister(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Customer.getQnAlister",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTemp3(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Customer.getTemp3",params);
	}


	@Override
	public int getQnABoarder(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("Customer.getQnABoarder",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTemp4(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("Customer.getTemp4",params);
	}


	@Override
	public String QnAinsert(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction(); //트랜잭션 실행
		sqlMapClient.startBatch(); //Batch 여러개를 이동할때 이걸사용하는게 좋음
								   //Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(작업량증가)
		try {
			sqlMapClient.insert("Customer.QnAinsert", params);
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction();//트랜잭션 적용
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res;
	}


	@Override
	public String Cusinsert(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction(); //트랜잭션 실행
		sqlMapClient.startBatch(); //Batch 여러개를 이동할때 이걸사용하는게 좋음
								   //Batch를 안쓰면 묶어두더라도 한개씩 쿼리를 날림(작업량증가)
		try {
			sqlMapClient.insert("Customer.Cusinsert", params);
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction();//트랜잭션 적용
			
			res = "true";
		} catch (Exception e) {
			res = "false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();
		
		return res;
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getQnAdetail1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (HashMap<String, String>) sqlMapClient.queryForObject("Customer.getQnAdetail1",params);
	}


	@Override
	public int getQnAdelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.update("Customer.getQnAdelete",params);
	}


	@Override
	public int getCusupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.update("Customer.getCusupdate",params);
	}


	@Override
	public int getCusdelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.update("Customer.getCusdelete",params);
	}

}
