package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface IAuctionService {

	int getAuctionCount(HashMap<String, String> params) throws Throwable;

	ArrayList<HashMap<String, String>> getAuction(HashMap<String, String> params) throws Throwable;

}
