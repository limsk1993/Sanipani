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


import com.spring.sample.web.Sanipani.service.IMyPageService;

@Controller
public class MyPageController {
		@Autowired
	   public IMyPageService iMainService;
	
		 @RequestMapping(value="/MyPage") //자유게시판목록 jsp 연결
		   public ModelAndView MyPage(HttpServletRequest request,
		                      ModelAndView modelAndView,
		                      HttpSession session){
		      modelAndView.setViewName("spMypage/Mypage");
		      return modelAndView;
		      
		   }
		 
		
	/*	 @RequestMapping(value="/MyPageDeTail") //글상세보기
		   public ModelAndView MyPageDeTail(HttpServletRequest request,
					@RequestParam HashMap<String, String> params,
					ModelAndView modelAndView, HttpSession session) throws Throwable{ //db에 붙을때 throws Throwable사용

			  HashMap<String, String> con = iMainService.getFreeBoardCon(params);
				
			  modelAndView.addObject("con", con);
				
		      modelAndView.setViewName("spMypage/Mypage");
		      
		      return  modelAndView;
		      
		  }*/
		 
		   @RequestMapping(value = "/MyPageDeTail") //게시판내용가져오기
		   public @ResponseBody ResponseEntity<String> MyPageDeTail(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		    
		      
		      ArrayList<HashMap<String, String>> list = iMainService.MyPageDeTail(params);
		           
		      modelMap.put("list", list);
		    
		      		            
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   
		   
			 @RequestMapping(value="/MyPage2") //글상세보기
			   public ModelAndView MyPage2(HttpServletRequest request,
	  					@RequestParam HashMap<String, String> params,
	  					ModelAndView modelAndView, HttpSession session) throws Throwable{ //db에 붙을때 throws Throwable사용

				  HashMap<String, String> con = iMainService.UserInfo(params);
					
				  modelAndView.addObject("con", con);
					
				  modelAndView.setViewName("spMypage/Mypage2");
			      
			      return  modelAndView;
			      
			  }
			 
			 @RequestMapping(value="/MyPage6") //글상세보기
			   public ModelAndView MyPage6(HttpServletRequest request,
	  					@RequestParam HashMap<String, String> params,
	  					ModelAndView modelAndView, HttpSession session) throws Throwable{ //db에 붙을때 throws Throwable사용

				  HashMap<String, String> con = iMainService.MemberCheck(params);
					
				  modelAndView.addObject("con", con);
					
				  modelAndView.setViewName("spMypage/Mypage6");
			      
			      return  modelAndView;
			      
			  }
			
			 @RequestMapping(value = "/Memberbye")
			   public @ResponseBody ResponseEntity<String> Memberbye(
			         HttpServletRequest request,
			         @RequestParam HashMap<String, String> params,
			         ModelAndView modelAndView) throws Throwable {
			      ObjectMapper mapper = new ObjectMapper();
			      Map<String, Object> modelMap = new HashMap<String, Object>();
			      
			      int res = iMainService.MemberBye(params);
			      
			      modelMap.put("res", res);
			      
			      HttpHeaders responseHeaders = new HttpHeaders();
			      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			      
			      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
			                                responseHeaders, HttpStatus.CREATED);   
			   }
			   @RequestMapping(value = "/updateUserInfo")
			   public @ResponseBody ResponseEntity<String> updateUserInfo(
			         HttpServletRequest request,
			         @RequestParam HashMap<String, String> params,
			         ModelAndView modelAndView) throws Throwable {
			      ObjectMapper mapper = new ObjectMapper();
			      Map<String, Object> modelMap = new HashMap<String, Object>();
			      
			      int res = iMainService.updateUserInfo(params);
			      
			      modelMap.put("res", res);
			      
			      HttpHeaders responseHeaders = new HttpHeaders();
			      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			      
			      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
			                                responseHeaders, HttpStatus.CREATED);   
			   }
			   
			   @RequestMapping(value="/MyPage3")
		          public ModelAndView userPw(HttpServletRequest request,
		                               HttpSession session,            
		                              @RequestParam HashMap<String, String> params,
		                              ModelAndView modelAndView) throws Throwable{ //db에 붙을때 throws Throwable사용
		            
		            params.put("sNo", session.getAttribute("sNo").toString());
		             
		            HashMap<String, String> con = iMainService.userPw(params);
		               
		            modelAndView.addObject("con", con); 
		               
		            modelAndView.setViewName("spMypage/Mypage3");  
		               
		            return modelAndView;
		  }
		          @RequestMapping(value="/PwUpdate")
		            public @ResponseBody ResponseEntity<String> PwUpdate(
		                     HttpServletRequest request,
		                     @RequestParam HashMap<String, String> params,
		                     ModelAndView modelAndView) throws Throwable {
		                  
		                  ObjectMapper mapper = new ObjectMapper();
		                  Map<String, Object> modelMap = new HashMap<String, Object>();
		                  
		                  int res = iMainService.PwUpdate(params);
		                        
		                  modelMap.put("res", res); //
		                  
		                  HttpHeaders responseHeaders = new HttpHeaders();
		                  responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		                  
		                  return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                            responseHeaders, HttpStatus.CREATED);
		         }
			   
				
		   
		
		
	
}
