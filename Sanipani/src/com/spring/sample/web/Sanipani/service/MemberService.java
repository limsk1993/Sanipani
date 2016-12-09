package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Sanipani.dao.IMemberDao;

@Service // 서비스 명명
public class MemberService implements IMemberService {
	@Autowired
	public IMemberDao iMemberDao;

	@Override
	public String insertRegister(HashMap<String, String> params) throws Throwable {
		return iMemberDao.insertRegister(params);
	}

	@Override
	public String selectRegister(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.selectRegister(params);
	}
	@Override
	public String select1Register(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.select1Register(params);
	}

	@Override
	public void insertPlusMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iMemberDao.insertPlusMoney(params);
	}

	@Override
	public void insertMinusMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iMemberDao.insertMinusMoney(params);
	}

	@Override
	public int getTradePage(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.getTradePage(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getTradeList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.getTradeList(params);
	}

	@Override
	public int getTradePageSell(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.getTradePageSell(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> getTradeListSell(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.getTradeListSell(params);
	}

	@Override
	public int getMoney(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.getMoney(params);
	}

	@Override
	public int showAutionBuyPage(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.showAutionBuyPage(params);
	}

	@Override
	public ArrayList<HashMap<String, String>> showAutionBuy(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iMemberDao.showAutionBuy(params);
	}
}
