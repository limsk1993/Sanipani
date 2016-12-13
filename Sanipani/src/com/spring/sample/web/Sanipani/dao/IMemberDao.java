package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IMemberDao {

	public String insertRegister(HashMap<String, String> params) throws Throwable;

	public String selectRegister(HashMap<String, String> params) throws Throwable;

	public String select1Register(HashMap<String, String> params) throws Throwable;

	public void insertPlusMoney(HashMap<String, String> params) throws Throwable;

	public void insertMinusMoney(HashMap<String, String> params) throws Throwable;

	public int getTradePage(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTradeList(HashMap<String, String> params) throws Throwable;

	public int getTradePageSell(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getTradeListSell(HashMap<String, String> params) throws Throwable;

	public int getMoney(HashMap<String, String> params) throws Throwable;

	public int showAutionBuyPage(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> showAutionBuy(HashMap<String, String> params) throws Throwable;

	public int showAutionTradePage(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> showAutionTrade(HashMap<String, String> params) throws Throwable; 

}
