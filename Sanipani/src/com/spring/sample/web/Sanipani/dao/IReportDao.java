package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IReportDao {
	
	public int getReportCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getReport(HashMap<String, String> params) throws Throwable;
	
	public String insertReport(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getReportCon(HashMap<String, String> params) throws Throwable;

	public void updatelook(HashMap<String, String> params) throws Throwable;

	public int getBlackListCount(HashMap<String, String> params) throws Throwable;
	
	public ArrayList<HashMap<String, String>> getBlackList(HashMap<String, String> params) throws Throwable;

	public int deleteReport(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBlackListCon(HashMap<String, String> params) throws Throwable;

	public int updateReport(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getReportCNT(HashMap<String, String> params) throws Throwable;

	public int updateWarning(HashMap<String, String> params) throws Throwable;


}
