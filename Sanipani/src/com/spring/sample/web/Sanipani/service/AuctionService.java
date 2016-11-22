package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IAuctionDao;

@Service
public class AuctionService implements IAuctionService {

	@Autowired
	public IAuctionDao iAuctionDao;
	
	@Override
	public int getAuctionCount(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.getAuctionCount(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getAuction(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.getAuction(params);
	}

	@Override
	public String insertAuction(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.insertAuction(params);
	}

	@Override
	public int deleteAuction(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.deleteAuction(params);
	}

	@Override
	public HashMap<String, String> getAuctionCon(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.getAuctionCon(params);
	}

}
