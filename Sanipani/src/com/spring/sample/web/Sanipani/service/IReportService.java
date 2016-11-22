package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface IReportService {

	int getReportCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getReport(HashMap<String, String> params) throws Throwable;


}
