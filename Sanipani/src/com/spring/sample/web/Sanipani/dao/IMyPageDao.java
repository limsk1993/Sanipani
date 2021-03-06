package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IMyPageDao {

	HashMap<String, String> getFreeBoardCon(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> MyPageDeTail(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> UserInfo(HashMap<String, String> params) throws Throwable;

	public int updateUserInfo(HashMap<String, String> params) throws Throwable;
	
	public int  MemberBye(HashMap<String, String> params) throws Throwable;
	
	HashMap<String, String> userPw(HashMap<String, String> params) throws Throwable;

	   int getPwUpdate(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> MemberCheck(HashMap<String, String> params) throws Throwable;

	

}
