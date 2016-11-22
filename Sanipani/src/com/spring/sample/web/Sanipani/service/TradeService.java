package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.ITradeDao;

@Service
public class TradeService implements ITradeService{
	@Autowired 
	public ITradeDao iTradeDao;

	@Override
	public int getTradeCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeCount(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getTradeBoard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeBoard(params);
	}
	
}
