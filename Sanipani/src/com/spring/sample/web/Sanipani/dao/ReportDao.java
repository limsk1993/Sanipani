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




	@Override
	public String insertReport(HashMap<String, String> params) throws Throwable {
		String res = "false";
		
		sqlMapClient.startTransaction();//트랜잭션 시작
		sqlMapClient.startBatch();
		
		try{
			sqlMapClient.insert("ReportBoard.insertReport", params);
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction();//트랜잭션 커밋
			
			res = "true";
			
		}catch(Exception e){
			res="false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();//트랜잭션 종료
		
		return res;
	}


	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getReportCon(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>)sqlMapClient.queryForObject("ReportBoard.getReportCon", params);
	}


	@Override
	public void updatelook(HashMap<String, String> params) throws Throwable {
	     sqlMapClient.update("ReportBoard.updatelook",params);
		
	}


	@Override
	public int getBlackListCount(HashMap<String, String> params) throws Throwable {
		return (int) sqlMapClient.queryForObject("ReportBoard.getBlackListCount", params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getBlackList(HashMap<String, String> params) throws Throwable {
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("ReportBoard.getBlackList", params);
	}


	@Override
	public int deleteReport(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("ReportBoard.deleteReport",params);
	}


	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getBlackListCon(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>)sqlMapClient.queryForObject("ReportBoard.getBlackListCon", params);

	}


	@Override
	public int updateReport(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("ReportBoard.updateReport",params);

	}


	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> getReportCNT(HashMap<String, String> params) throws Throwable {
		return (HashMap<String, String>)sqlMapClient.queryForObject("ReportBoard.getReportCNT", params);
	}


	@Override
	public int updateWarning(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("ReportBoard.updateWarning",params);
		
	}


	@Override
	public int updateBlacklist(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("ReportBoard.updateBlacklist",params);
	}


	@Override
	public String insertBlacklist(HashMap<String, String> params) throws Throwable {
		String BLres = "false";
		
		sqlMapClient.startTransaction();//트랜잭션 시작
		sqlMapClient.startBatch();
		
		try{
			sqlMapClient.insert("ReportBoard.insertBlacklist", params);
			
			sqlMapClient.executeBatch();
			sqlMapClient.commitTransaction();//트랜잭션 커밋
			
			BLres = "true";
			
		}catch(Exception e){
			BLres="false";
			e.printStackTrace();
		}
		
		sqlMapClient.endTransaction();//트랜잭션 종료
		
		return BLres;
	}


	@Override
	public int deleteBlackList(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("ReportBoard.deleteBlackList",params);
	}


	@Override
	public int deleteBlackList2(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.update("ReportBoard.deleteBlackList2",params);
	}


	@Override
	public int deleteBlackList3(HashMap<String, String> params) throws Throwable {
		return sqlMapClient.delete("ReportBoard.deleteBlackList3",params);
	}
	
	
}
