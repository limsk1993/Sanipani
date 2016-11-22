package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ITradeDao {

	int getTradeCount(HashMap<String, String> params) throws Throwable;

	ArrayList<HashMap<String, String>> getTradeBoard(HashMap<String, String> params) throws Throwable;

}
