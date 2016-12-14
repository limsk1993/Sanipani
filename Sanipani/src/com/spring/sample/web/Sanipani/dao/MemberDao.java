package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository // 저장소 명명
public class MemberDao implements IMemberDao {
	@Autowired
	public SqlMapClient sqlMapClient;

	@Override
	public String insertRegister(HashMap<String, String> params) throws Throwable {
		String res="false";		
		try{
			sqlMapClient.insert("register.memberRegister", params);	
			res = "true";
		} catch(Exception e){
			res = "false";
		}		
		return res;
	}
	@Override
	public String selectRegister(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
			return (String) sqlMapClient.queryForObject("register.selectRegister",params);	
	}
	@Override
	public String select1Register(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
			return (String) sqlMapClient.queryForObject("register.select1Register",params);
	}
	@Override
	public void insertPlusMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("register.insertPlusMoney",params);
		
	}
	@Override
	public void insertMinusMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlMapClient.insert("register.insertMinusMoney",params);
	}
	@Override
	public int getTradePage(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("register.getTradePage",params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTradeList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("register.getTradeList", params);
	}
	@Override
	public int getTradePageSell(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("register.getTradePageSell", params);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> getTradeListSell(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("register.getTradeListSell", params);
	}
	@Override
	public int getMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("register.getMoney",params);
	}
	@Override
	public int showAutionBuyPage(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("register.showAutionBuyPage",params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> showAutionBuy(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("register.showAutionBuy",params);
	}
	@Override
	public int showAutionTradePage(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (int) sqlMapClient.queryForObject("register.showAutionTradePage", params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<HashMap<String, String>> showAutionTrade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, String>>) sqlMapClient.queryForList("register.showAutionTrade",params);
	}
	
}
