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

	@Override
	public String insertTrade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.insertTrade(params);
	}

	@Override
	public String insertTrade1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.insertTrade1(params);
	}

	@Override
	public int getTradeNo() throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeNo();
	}

	@Override
	public HashMap<String, String> getTradeCon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeCon(params);
	}

	@Override
	public String insertTrade2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.insertTrade2(params);
	}

	@Override
	public void getTradereple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.getTradereple(params);
	}

	@Override
	public void deleteTrade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.deleteTrade(params);
	}

	@Override
	public String updateTrade1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.updateTrade1(params);
	}

	@Override
	public String updateTrade2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.updateTrade2(params);
	}

	@Override
	public String insertEscrow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.insertEscrow(params);
	}

	@Override
	public HashMap<String, String> getTradeUser1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeUser1(params);
	}

	@Override
	public HashMap<String, String> getTradeUser2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeUser2(params);
	}

	@Override
	public String updateStatus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.updateStatus(params);
	}

	@Override
	public String updateStatus1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.updateStatus1(params);
	}

	@Override
	public HashMap<String, String> getStatus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getStatus(params);
	}

	@Override
	public int getStatusNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getStatusNo(params);
	}

	@Override
	public HashMap<String, String> getTradeStatus1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeStatus1(params);
	}

	

	@Override
	public void insertMoneyStatus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.insertMoneyStatus(params);
	}

	@Override
	public HashMap<String, String> getTradeTotal1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeTotal1(params);
	}

	@Override
	public String DeliveryUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.DeliveryUpdate(params);
	}

	@Override
	public HashMap<String, String> getTradeDelivery(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeDelivery(params);
	}

	@Override
	public void CompleteUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.CompleteUpdate(params);
	}

	@Override
	public Long getTradeUserNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeUserNo(params);
	}

	@Override
	public void MoneyUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.MoneyUpdate(params);
	}

	@Override
	public HashMap<String, String> getTradeCon1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getTradeCon1(params);
	}

	@Override
	public void insertBuyerMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.insertBuyerMoney(params);
	}

	@Override
	public void updateStar(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.updateStar(params);
	}

	@Override
	public HashMap<String, String> getStarCount(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getStarCount(params);
	}

	@Override
	public void updateRank1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.updateRank1(params);
	}

	@Override
	public void TradeCencelDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.TradeCencelDel(params);
	}

	@Override
	public void TradeOtherDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.TradeOtherDel(params);
	}

	@Override
	public void insertReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.insertReple(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getshowReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.getshowReple(params);
	}

	@Override
	public void updateDelReple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iTradeDao.updateDelReple(params);
	}

	@Override
	public String insertReport(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iTradeDao.insertReport(params);
	}

	

	

	

	
	
}
