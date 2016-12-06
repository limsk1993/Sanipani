package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface IFreeService {

	public int getFreeBoardCount(HashMap<String, String> params) throws Throwable;
	
	public int getFreeRepleCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getFreeBoard(HashMap<String, String> params)throws Throwable;
	
	public ArrayList<HashMap<String, String>> getFreeReple(HashMap<String, String> params)throws Throwable;

	HashMap<String, String> getFreeBoardCon(HashMap<String, String> params) throws Throwable;

	public String FreeBoardAdd(HashMap<String, String> params) throws Throwable;

	public String FreeRepleAdd(HashMap<String, String> params) throws Throwable;

	public int updateFreeBoard(HashMap<String, String> params) throws Throwable;

	public int DeleteFreeBoard(HashMap<String, String> params) throws Throwable;

	public int FreeBoardLookUp(HashMap<String, String> params) throws Throwable;

	public int RepleDelete(HashMap<String, String> params) throws Throwable;

	

	
	
}
