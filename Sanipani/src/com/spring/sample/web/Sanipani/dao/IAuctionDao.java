package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IAuctionDao {

	public int getAuctionCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getAuction(HashMap<String, String> params) throws Throwable;

	public String insertAuction(HashMap<String, String> params) throws Throwable;

}
