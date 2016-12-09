package com.spring.sample.web.Sanipani.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface IAuctionService {

	public int getAuctionCount(HashMap<String, String> params) throws Throwable;

	public ArrayList<HashMap<String, String>> getAuction(HashMap<String, String> params) throws Throwable;

	public String insertAuction(HashMap<String, String> params) throws Throwable;

	public int deleteAuction(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAuctionCon(HashMap<String, String> params) throws Throwable;

	public String insertAuctionPicture(HashMap<String, String> params) throws Throwable;

	public int getAuctionNo() throws Throwable;

	public int updateAuction(HashMap<String, String> params) throws Throwable;

	public String updateAuctionPriceRegist(HashMap<String, String> params) throws Throwable;

	public int updateAuctionPriceCancel(HashMap<String, String> params) throws Throwable;

	public int updateAuctionAddDate(HashMap<String, String> params) throws Throwable;

	public int updateAuctionEnd(HashMap<String, String> params) throws Throwable;

	public int updateAuctionEnd2(HashMap<String, String> params) throws Throwable;

	public int updateAuctionLookup(HashMap<String, String> params) throws Throwable;

	public int deleteNotAuctionMember(HashMap<String, String> params) throws Throwable;
}
