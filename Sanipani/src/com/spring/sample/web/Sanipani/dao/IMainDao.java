package com.spring.sample.web.Sanipani.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IMainDao {

	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getNotice(HashMap<String, String> params) throws Throwable;

	public int getNoticeCount(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getNoticeCon(HashMap<String, String> params) throws Throwable;

	public int deleteNotice(HashMap<String, String> params) throws Throwable;

	public int updateNotice(HashMap<String, String> params) throws Throwable;

	public String insertNotice(HashMap<String, String> params) throws Throwable;
}
