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
		   
		 
		   
		
		   
		   return modelAndView;
	   }
	   @RequestMapping(value = "/refreshTest")
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

	

}
