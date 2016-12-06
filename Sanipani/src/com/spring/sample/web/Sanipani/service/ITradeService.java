package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ITradeService {

	int getTradeCount(HashMap<String, String> params) throws Throwable ;

	ArrayList<HashMap<String, String>> getTradeBoard(HashMap<String, String> params) throws Throwable;

	String insertTrade(HashMap<String, String> params) throws Throwable;

	String insertTrade1(HashMap<String, String> params) throws Throwable;

	int getTradeNo() throws Throwable;

	HashMap<String, String> getTradeCon(HashMap<String, String> params) throws Throwable;

	String insertTrade2(HashMap<String, String> params) throws Throwable;

	void getTradereple(HashMap<String, String> params) throws Throwable;

	void deleteTrade(HashMap<String, String> params) throws Throwable;

	String updateTrade1(HashMap<String, String> params) throws Throwable;

	String updateTrade2(HashMap<String, String> params) throws Throwable;

	String insertEscrow(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTradeUser1(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTradeUser2(HashMap<String, String> params) throws Throwable;

	String updateStatus(HashMap<String, String> params) throws Throwable;

	String updateStatus1(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getStatus(HashMap<String, String> params) throws Throwable;

	int getStatusNo(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTradeStatus1(HashMap<String, String> params) throws Throwable;



	void insertMoneyStatus(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTradeTotal1(HashMap<String, String> params) throws Throwable;

	String DeliveryUpdate(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTradeDelivery(HashMap<String, String> params) throws Throwable;

	void CompleteUpdate(HashMap<String, String> params) throws Throwable;

	Long getTradeUserNo(HashMap<String, String> params) throws Throwable;

	void MoneyUpdate(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getTradeCon1(HashMap<String, String> params) throws Throwable;

	void insertBuyerMoney(HashMap<String, String> params) throws Throwable;

	void updateStar(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getStarCount(HashMap<String, String> params) throws Throwable;

	void updateRank1(HashMap<String, String> params) throws Throwable;

	void TradeCencelDel(HashMap<String, String> params) throws Throwable;

	void TradeOtherDel(HashMap<String, String> params) throws Throwable;

	void insertReple(HashMap<String, String> params) throws Throwable;

	ArrayList<HashMap<String, String>> getshowReple(HashMap<String, String> params) throws Throwable;

	void updateDelReple(HashMap<String, String> params) throws Throwable;

	String insertReport(HashMap<String, String> params) throws Throwable;






	

	


	

	

}
