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
	


}
