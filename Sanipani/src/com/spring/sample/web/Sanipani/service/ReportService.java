package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IReportDao;

@Service
public class ReportService implements IReportService {

	@Autowired
	public IReportDao iReportDao;

	@Override
	public int getReportCount(HashMap<String, String> params) throws Throwable {
		return iReportDao.getReportCount(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getReport(HashMap<String, String> params) throws Throwable {
		return iReportDao.getReport(params);
	}

	@Override
	public String insertReport(HashMap<String, String> params) throws Throwable {
		return iReportDao.insertReport(params);
	}

	@Override
	public HashMap<String, String> getReportCon(HashMap<String, String> params) throws Throwable {
		return iReportDao.getReportCon(params);
	}

	@Override
	public void updatelook(HashMap<String, String> params) throws Throwable {
	    iReportDao.updatelook(params);

		
	}

	@Override
	public int getBlackListCount(HashMap<String, String> params) throws Throwable {
		return iReportDao.getBlackListCount(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getBlackList(HashMap<String, String> params) throws Throwable {
		return iReportDao.getBlackList(params);
	}

	@Override
	public int deleteReport(HashMap<String, String> params) throws Throwable {
		return iReportDao.deleteReport(params);
	}

	@Override
	public HashMap<String, String> getBlackListCon(HashMap<String, String> params) throws Throwable {
		return iReportDao.getBlackListCon(params);
	}

	@Override
	public int updateReport(HashMap<String, String> params) throws Throwable {
		return iReportDao.updateReport(params);		
	}

	@Override
	public HashMap<String, String> getReportCNT(HashMap<String, String> params) throws Throwable {
		return iReportDao.getReportCNT(params);
	}

	@Override
	public int updateWarning(HashMap<String, String> params) throws Throwable {
		return iReportDao.updateWarning(params);
	}

	


}
