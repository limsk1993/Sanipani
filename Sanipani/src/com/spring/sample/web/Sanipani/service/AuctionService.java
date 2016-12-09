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

	@Override
	public String insertAuctionPicture(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.insertAuctionPicture(params);
	}

	@Override
	public int getAuctionNo() throws Throwable {
		return iAuctionDao.getAuctionNo();
	}

	@Override
	public int updateAuction(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuction(params);
	}

	@Override
	public String updateAuctionPriceRegist(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuctionPriceRegist(params);
	}

	@Override
	public int updateAuctionPriceCancel(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuctionPriceCancel(params);
	}

	@Override
	public int updateAuctionAddDate(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuctionAddDate(params);
	}

	@Override
	public int updateAuctionEnd(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuctionEnd(params);
	}

	@Override
	public int updateAuctionEnd2(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuctionEnd2(params);
	}

	@Override
	public int updateAuctionLookup(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.updateAuctionLookup(params);
	}

	@Override
	public int deleteNotAuctionMember(HashMap<String, String> params) throws Throwable {
		return iAuctionDao.deleteNotAuctionMember(params);
	}
}
