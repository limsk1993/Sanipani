package com.spring.sample.web.Sanipani.controller;

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

import com.spring.sample.web.Sanipani.service.IMainService;

@Controller
public class MainController {
	   @Autowired
	   public IMainService iMainService;
	   
	
	 @RequestMapping(value="/Mainpage")
	   public ModelAndView Mainpage(HttpServletRequest request,
	                      ModelAndView modelAndView){
	      modelAndView.setViewName("spmain/Mainpage");// /<<는 경로 ㅋ
	      return modelAndView;
	   }
	 
	 @RequestMapping(value="/AuctionBoard")
	   public ModelAndView AuctionBoard(HttpServletRequest request,
	                      ModelAndView modelAndView){
	      modelAndView.setViewName("spAuctionBoard/AuctionBoard");
	      return modelAndView;
	      
	   }
	 
	   @RequestMapping(value = "/testLoginCheckAjax")
	   public @ResponseBody ResponseEntity<String> testLoginCheckAjax(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         HttpSession session,
	         ModelAndView modelAndView) throws Throwable {
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	     HashMap<String,String> mem = iMainService.getMem(params);

	      if(mem != null && !mem.isEmpty()){
	    	  session.setAttribute("sNo", mem.get("MEMBERNO"));
	    	  session.setAttribute("sNick", mem.get("NICK"));
	    	  session.setAttribute("sId", mem.get("ID"));
	    	
	      
	    	  modelMap.put("res","success");
	    	  modelMap.put("NICK",mem.get("NICK"));
	      }
	      else {
	    	  modelMap.put("res", "fail");
	      }
	      
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
	   
	   @RequestMapping(value="/testLogout")
	   public ModelAndView testLogout (HttpServletRequest request,
			   							HttpSession session
			   							,ModelAndView modelAndView){
		   session.invalidate();//세션을 초기화 하겠다
		   modelAndView.setViewName("redirect:Mainpage");//redirect를 쓰면 데이터가 get방식으로 전송되어 주소창에 데이터가 보인다 
		   
		   return modelAndView;
	   }
	   
}
