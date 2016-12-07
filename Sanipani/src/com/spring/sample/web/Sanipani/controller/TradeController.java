package com.spring.sample.web.Sanipani.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sample.common.bean.PagingBean;
import com.spring.sample.common.service.IPagingService;
import com.spring.sample.web.Sanipani.service.ITradeService;
import com.sun.xml.internal.bind.v2.runtime.Location;

@Controller
public class TradeController {
		@Autowired
		public ITradeService iTradeService;
		@Autowired
		public IPagingService iPagingService;
		@RequestMapping(value="/TradeBoard")
		
		
		public ModelAndView TradeBoard(HttpServletRequest request,
			   					HttpSession session,
			   					ModelAndView modelAndView) {
		
			   modelAndView.setViewName("spTradeBoard/TradeBoard");
		   
		 
		   System.out.println("session no : " + session.getAttribute("sNo"));
		
		   
		   return modelAndView;
	   }	
		@RequestMapping(value = "/TradeBoard1")
		public ModelAndView TradeBoard1(HttpServletRequest request,
					HttpSession session,
					ModelAndView modelAndView) {
					modelAndView.setViewName("spTradeBoard/TradeBoard1");
					System.out.println("session no : " + session.getAttribute("sNo"));
					return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard2")
		public ModelAndView TradeBoard2(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard2");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard3")
		public ModelAndView TradeBoard3(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard3");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard4")
		public ModelAndView TradeBoard4(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard4");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard5")
		public ModelAndView TradeBoard5(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard5");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard6")
		public ModelAndView TradeBoard6(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard6");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard7")
		public ModelAndView TradeBoard7(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard7");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
		@RequestMapping(value = "/TradeBoard8")
		public ModelAndView TradeBoard8(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
				modelAndView.setViewName("spTradeBoard/TradeBoard8");
				System.out.println("session no : " + session.getAttribute("sNo"));
				return modelAndView;
		}
	   @RequestMapping(value = "/refreshTest1")
	   public @ResponseBody ResponseEntity<String> refreshTest(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,/*여러개의 값을 한번에 넣어 한번에 받아옴.*/
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iTradeService.getTradeCount(params));
	      
	      params.put("start", Integer.toString(pb.getStartCount()));
	      params.put("end", Integer.toString(pb.getEndCount()));
	      System.out.println(params.get("searchText"));
	      ArrayList<HashMap<String, String>> list = iTradeService.getTradeBoard(params);
	           
	      modelMap.put("list", list);
	      modelMap.put("pb", pb);
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value = "/showReple")
	   public @ResponseBody ResponseEntity<String> showReple(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,/*여러개의 값을 한번에 넣어 한번에 받아옴.*/
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	 
	      ArrayList<HashMap<String, String>> list1 = iTradeService.getshowReple(params);
	           
	      modelMap.put("list1", list1);
	    
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   @RequestMapping(value="/TradeBoardAdd")
	   public ModelAndView TradeBoardAdd(HttpServletRequest request,
			   							HttpSession session,
			   							ModelAndView modelAndView ){
		   modelAndView.setViewName("spTradeBoard/TradeBoardAdd");
		   
		   return modelAndView;
	   }

	   
	   @RequestMapping(value = "/insertTrade")
	   public @ResponseBody ResponseEntity<String> insertTrade(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      System.out.println(params.get("textFile"));
	     /* params.put("a", a);*/
	      System.out.println(params.get("TradeMemberNo"));
	      String res = iTradeService.insertTrade(params);
	      int no = iTradeService.getTradeNo();
	      params.put("No", Integer.toString(no));
	      String res1 = iTradeService.insertTrade1(params);
	      /*String res2 = iTradeService.insertTrade2(params);*/
	    
	      
	      modelMap.put("res", res);
	      modelMap.put("res1", res1);
	      /*modelMap.put("res2", res2);*/

	      
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   @RequestMapping(value="/TradeBoardLook")
	   public ModelAndView TradeBoardLook(HttpServletRequest request,
			   							  HttpSession session,
			   							  @RequestParam HashMap<String, String> params,
			   							  ModelAndView modelAndView) throws Throwable{
		   
		   
		   iTradeService.getTradereple(params);
		
		   HashMap<String, String> con = iTradeService.getTradeCon(params);
		   HashMap<String, String> con1 = iTradeService.getTradeCon1(params);
		   modelAndView.addObject("con", con); 
		   modelAndView.addObject("con1", con1); 
		   
		   modelAndView.setViewName("spTradeBoard/TradeBoardLook");
		
		   return modelAndView;
	   }
	   
	   @RequestMapping(value="/TradeUpdate")
	   public ModelAndView TradeUpdate(HttpServletRequest request,
			   							  HttpSession session,
			   							  @RequestParam HashMap<String, String> params,
			   							  ModelAndView modelAndView) throws Throwable{
		   
		 
		   iTradeService.getTradereple(params);
		   HashMap<String, String> con = iTradeService.getTradeCon(params);
		   
		   modelAndView.addObject("con", con); 
		   
		   modelAndView.setViewName("spTradeBoard/TradeUpdate");
		
		   return modelAndView;
	   }

	   @RequestMapping(value="/TradeDelete")
	   public ModelAndView TradeDelete(HttpServletRequest request,
			   							HttpSession session,
			   							ModelAndView modelAndView ){
		   modelAndView.setViewName("spTradeBoard/TradeDelete");
		   
		   return modelAndView;
	   }



	
	   @RequestMapping(value = "/deleteTrade")
	   public @ResponseBody ResponseEntity<String> deleteTrade(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iTradeService.deleteTrade(params);
	      
	    

	      
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   @RequestMapping(value = "/updateTrade")
	   public @ResponseBody ResponseEntity<String> updateTrade(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      /*int res = iTradeService.updateTrade1(params);
	      
	      int res1 = iTradeService.updateTrade2(params);
	      
	      modelMap.put("res", res);
	      modelMap.put("res1", res1);*/
	      
	      String res = iTradeService.updateTrade1(params);
	      String res1 = iTradeService.updateTrade2(params);

	      modelMap.put("res", res);
	      modelMap.put("res1", res1);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value="/TradeEscrow")
	   public ModelAndView TradeEscrow(HttpServletRequest request,
			   							HttpSession session,
			   							ModelAndView modelAndView ){
		   
		   modelAndView.setViewName("spTradeBoard/TradeEscrow");
		   
		   return modelAndView;
	   }
	   
	   
	   
	   @RequestMapping(value = "/EscrowInsert")
	   public @ResponseBody ResponseEntity<String> EscrowInsert(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      int no = iTradeService.getStatusNo(params);
	      System.out.println("safsedffaefadawwd::::"+no);
		  params.put("TradeNo", Integer.toString(no));
	
	      String res3 = iTradeService.insertEscrow(params);
	      modelMap.put("res", res3);
	      modelMap.put("no", no);
		
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   @RequestMapping(value="/TradeRequest")
	   public ModelAndView TradeRequest(HttpServletRequest request,
			   							  HttpSession session,
			   							  @RequestParam HashMap<String, String> params,
			   							  ModelAndView modelAndView) throws Throwable{
		   
	
		   iTradeService.getTradereple(params);
		   HashMap<String, String> con = iTradeService.getStatus(params);
		   
		   modelAndView.addObject("con", con); 
		   
		   modelAndView.setViewName("spTradeBoard/TradeRequest");
		
		   return modelAndView;
	   }
	   
	   
	   
	   @RequestMapping(value="/TradeStatus")
	   public ModelAndView TradeStatus(HttpServletRequest request,
			   							  HttpSession session,
			   							  @RequestParam HashMap<String, String> params,
			   							  ModelAndView modelAndView) throws Throwable{
	
		   
		   iTradeService.getTradereple(params);
		   HashMap<String, String> con = iTradeService.getTradeUser1(params);
		   HashMap<String, String> con1 = iTradeService.getTradeUser2(params);
		   HashMap<String, String> con2 = iTradeService.getTradeStatus1(params);	
		   modelAndView.addObject("con2", con2);
		   modelAndView.addObject("con", con);
		   modelAndView.addObject("con1", con1); 
		   
		   modelAndView.setViewName("spTradeBoard/TradeStatus");
		
		   return modelAndView;
	   }
	   
	   
	   
	   @RequestMapping(value = "/StatusInsert")
	   public @ResponseBody ResponseEntity<String> StatusInsert(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	  
	      
	      String buy = iTradeService.updateStatus(params);
	      modelMap.put("buy", buy);
	      HashMap<String, String> con2 = iTradeService.getTradeStatus1(params);	
	      modelMap.put("con2", con2);
	      HashMap<String, String> con3 = iTradeService.getTradeTotal1(params);	
	      modelMap.put("con3", con3);
		   
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value = "/StatusInsert1")
	   public @ResponseBody ResponseEntity<String> StatusInsert1(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	  
	      String sell = iTradeService.updateStatus1(params);
	      modelMap.put("sell", sell);
	      HashMap<String, String> con2 = iTradeService.getTradeStatus1(params);	
	      modelMap.put("con2", con2);
	      HashMap<String, String> con3 = iTradeService.getTradeTotal1(params);	
	      modelMap.put("con3", con3);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value = "/updateMoneyStatus")
	   public @ResponseBody ResponseEntity<String> updateMoneyStatus(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	  
	      
	     iTradeService.insertBuyerMoney(params);
	     HashMap<String, String> con2 = iTradeService.getTradeStatus1(params);	
	      modelMap.put("con2", con2);
		   
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   
	   @RequestMapping(value="/TradeStatus1")
	   public ModelAndView TradeStatus1(HttpServletRequest request,
			   							  HttpSession session,
			   							  @RequestParam HashMap<String, String> params,
			   							  ModelAndView modelAndView) throws Throwable{
		   iTradeService.getTradereple(params);
		   HashMap<String, String> con = iTradeService.getTradeUser1(params);
		   HashMap<String, String> con1 = iTradeService.getTradeUser2(params);
		   HashMap<String, String> con2 = iTradeService.getTradeDelivery(params);	
		   modelAndView.addObject("con", con);
		   modelAndView.addObject("con1", con1); 
		   modelAndView.addObject("con2", con2); 
		   
		  
		   
		   modelAndView.setViewName("spTradeBoard/TradeStatus1");
		
		   return modelAndView;
	   }
	   
	   
	   @RequestMapping(value = "/DeliveryUpdate")
	   public @ResponseBody ResponseEntity<String> DeliveryUpdate(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	  
	      String res = iTradeService.DeliveryUpdate(params);
	      modelMap.put("res", res);
	      HashMap<String, String> con = iTradeService.getTradeDelivery(params);	
	      modelMap.put("con", con);
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value = "/CompleteUpdate")
	   public @ResponseBody ResponseEntity<String> CompleteUpdate(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      Long no = iTradeService.getTradeUserNo(params);
	      params.put("SellNo", Long.toString(no));
	      iTradeService.MoneyUpdate(params);
	      
	      iTradeService.CompleteUpdate(params);
	      
	      modelMap.put("SellNo", Long.toString(no));
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }

	   
	   @RequestMapping(value = "/updateStar")
	   public @ResponseBody ResponseEntity<String> updateStar(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	    
	      iTradeService.updateStar(params);
	      HashMap<String, String> con6 = iTradeService.getStarCount(params);	
	      modelMap.put("con6", con6);
	      
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   @RequestMapping(value = "/updateRank1")
	   public @ResponseBody ResponseEntity<String> updateRank1(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iTradeService.updateRank1(params);
	     
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   @RequestMapping(value = "/TradeCencelDel")
	   public @ResponseBody ResponseEntity<String> TradeCencelDel(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iTradeService.TradeCencelDel(params);
	     
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value="/DeliIntroPage")
	   public ModelAndView DeliIntroPage(HttpServletRequest request,
			   							HttpSession session,
			   							ModelAndView modelAndView ){
		   
		   modelAndView.setViewName("spTradeBoard/DeliIntroPage");
		   
		   return modelAndView;
	   }
	   
	   @RequestMapping(value="/DeliShowPage")
	   public ModelAndView DeliShowPage(HttpServletRequest request,
			   							HttpSession session,
			   							ModelAndView modelAndView ){
		   
		   modelAndView.setViewName("spTradeBoard/DeliShowPage");
		   
		   return modelAndView;
	   }
	
	 
	   @RequestMapping(value = "/TradeOtherDel")
	   public @ResponseBody ResponseEntity<String> TradeOtherDel(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iTradeService.TradeOtherDel(params);
	     
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value = "/insertReple")
	   public @ResponseBody ResponseEntity<String> insertReple(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iTradeService.insertReple(params);
	     
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   
	   @RequestMapping(value = "/updateDelReple")
	   public @ResponseBody ResponseEntity<String> updateDelReple(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iTradeService.updateDelReple(params);
	    
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }

	   
	   @RequestMapping(value = "/insertTradeReport")
	   public @ResponseBody ResponseEntity<String> insertTradeReport(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      String res=iTradeService.insertReport(params);
	      modelMap.put("res", res);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
}
