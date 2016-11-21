package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ITradeService {

	int getTradeCount(HashMap<String, String> params) throws Throwable ;

	ArrayList<HashMap<String, String>> getTradeBoard(HashMap<String, String> params) throws Throwable;

}
