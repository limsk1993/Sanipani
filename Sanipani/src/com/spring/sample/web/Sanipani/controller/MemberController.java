package com.spring.sample.web.Sanipani.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Param;
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
import com.spring.sample.web.Sanipani.service.IMemberService;

@Controller
public class MemberController {
	 
	@Autowired
	public IMemberService iMemberService;
	@Autowired
	public IPagingService iPagingService;
	 @RequestMapping(value="/spmember")
	 public ModelAndView spmember(HttpServletRequest request, ModelAndView modelAndView){
		   modelAndView.setViewName("spmember/spmember");// /<<는 경로 ㅋ
		      return modelAndView;
	 }
	 @RequestMapping(value="/spmember1")
	 public ModelAndView spmember1(HttpServletRequest request, ModelAndView modelAndView){
		   modelAndView.setViewName("spmember/spmember1");// /<<는 경로 ㅋ
		      return modelAndView;
	 }
	 @RequestMapping(value="/spmember2")
	 public ModelAndView spmember2(HttpServletRequest request, ModelAndView modelAndView){
		   modelAndView.setViewName("spmember/spmember2");// /<<는 경로 ㅋ
		      return modelAndView;
	 }
	 @RequestMapping(value="/Ex4")
	 public ModelAndView Ex4(HttpServletRequest request, ModelAndView modelAndView){
		   modelAndView.setViewName("spmember/Ex4");// /<<는 경로 ㅋ
		      return modelAndView;
	 	}
	 
	 @RequestMapping(value="/spmemberMoney")
	 public ModelAndView spmemberMoney(HttpServletRequest request,
				HttpSession session,
				 @RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
		 	
		 		
		 		
		 	
		  
		 		
		 
		 		modelAndView.setViewName("spmember/spmemberMoney"); 		

		 		return modelAndView;
	 	}
	 
	 @RequestMapping(value="/spmemberBasket")
	 public ModelAndView spmemberBasket(HttpServletRequest request,
				HttpSession session,
				ModelAndView modelAndView) {
		 
		 		modelAndView.setViewName("spmember/spmemberBasket"); 		

		 		return modelAndView;
	 	}
	 
	 
	 @RequestMapping(value = "/getMoney")
	   public @ResponseBody ResponseEntity<String> getMoney(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      int money = iMemberService.getMoney(params); 
	      
	      modelMap.put("money", money);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	 
	 
	 
	 @RequestMapping(value = "/insertRegister")
	   public @ResponseBody ResponseEntity<String> insertRegister(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      String res = iMemberService.insertRegister(params);
	      
	      modelMap.put("res", res);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	 
	 
	 
	 
	 
	 @RequestMapping(value = "/selectRegister")
	   public @ResponseBody ResponseEntity<String> selectRegister(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      String res1 = iMemberService.selectRegister(params);
	      
	      modelMap.put("res1", res1);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	 @RequestMapping(value = "/select1Register")
	   public @ResponseBody ResponseEntity<String> select1Register(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      String res2 = iMemberService.select1Register(params);
	      
	      modelMap.put("res2", res2);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	 
	 	@RequestMapping(value = "/insertPlusMoney")
	 	public @ResponseBody ResponseEntity<String> insertPlusMoney(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iMemberService.insertPlusMoney(params);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	 	
	 	
	 	
	 	@RequestMapping(value = "/insertMinusMoney")
	 	public @ResponseBody ResponseEntity<String> insertMinusMoney(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      iMemberService.insertMinusMoney(params);
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8"); 
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	 	
	 	
	 	
	 	
	 	
	 	
	 	 @RequestMapping(value = "/showTrade")
		   public @ResponseBody ResponseEntity<String> showTrade(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,/*여러개의 값을 한번에 넣어 한번에 받아옴.*/
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iMemberService.getTradePage(params));
		      
		      params.put("start", Integer.toString(pb.getStartCount()));
		      params.put("end", Integer.toString(pb.getEndCount()));
		      System.out.println(params.get("searchText"));
		      ArrayList<HashMap<String, String>> list = iMemberService.getTradeList(params);
		           
		      modelMap.put("list", list);
		      modelMap.put("pb", pb);
		            
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
	 	 
	 	 
	 	 
	 	 @RequestMapping(value = "/showTradeSell")
		   public @ResponseBody ResponseEntity<String> showTradeSell(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,/*여러개의 값을 한번에 넣어 한번에 받아옴.*/
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iMemberService.getTradePageSell(params));
		      
		      params.put("start", Integer.toString(pb.getStartCount()));
		      params.put("end", Integer.toString(pb.getEndCount()));
		      System.out.println(params.get("searchText"));
		      ArrayList<HashMap<String, String>> list = iMemberService.getTradeListSell(params);
		           
		      modelMap.put("list", list);
		      modelMap.put("pb", pb);
		            
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
	 
}