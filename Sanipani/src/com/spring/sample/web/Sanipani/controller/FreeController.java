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
import com.spring.sample.web.Sanipani.service.IFreeService;

@Controller
public class FreeController {
	   @Autowired
	   public IFreeService iFreeService;
	   @Autowired
	   public IPagingService iPagingService;
	
	 @RequestMapping(value="/FreeBoard") //자유게시판목록 jsp 연결
	   public ModelAndView FreeBoard(HttpServletRequest request,
	                      ModelAndView modelAndView,
	                      HttpSession session){
	      modelAndView.setViewName("FreeBoard/FreeBoard");
	      return modelAndView;
	      
	   }
	 
	 @RequestMapping(value="/FreeBoardAdd") //글쓰기 jsp 연결
	   public ModelAndView FreeBoardWord(HttpServletRequest request,
	                      ModelAndView modelAndView,
	                      HttpSession session){
	      modelAndView.setViewName("FreeBoard/FreeBoardAdd");
	      return modelAndView;
	      
	   }
	  @RequestMapping(value="/FreeBoardMod") // 게시판 글쓰기 jsp 연결
	  public ModelAndView FreeBoardMod(HttpServletRequest request,
		   					     @RequestParam HashMap<String, String> params,
         		   				 ModelAndView modelAndView,
         		   				HttpSession session) throws Throwable{ //db에 붙을때 throws Throwable사용
		   
		  HashMap<String, String> con = iFreeService.getFreeBoardCon(params);
		   
		  modelAndView.addObject("con", con); 
		   
		  modelAndView.setViewName("FreeBoard/FreeBoardMod");  
		   
		  return modelAndView;
	  }
	   

	 
//     게시판목록가져오기	 
	   @RequestMapping(value = "/refreshFreeBoard") //게시판내용가져오기
	   public @ResponseBody ResponseEntity<String> refreshFreeBoard(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iFreeService.getFreeBoardCount(params));
	      
	      params.put("start", Integer.toString(pb.getStartCount()));
	      params.put("end", Integer.toString(pb.getEndCount()));
	      
	      ArrayList<HashMap<String, String>> list = iFreeService.getFreeBoard(params);
	           
	      modelMap.put("list", list);
	      modelMap.put("pb", pb);
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   
//     댓글내용 실시간으로 가져오기	   
	   @RequestMapping(value = "/refreshFreeBoardReple") //댓글내용가져오기
	   public @ResponseBody ResponseEntity<String> refreshFreeBoardReple(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iFreeService.getFreeRepleCount(params));
	      
	      params.put("start", Integer.toString(pb.getStartCount()));
	      params.put("end", Integer.toString(pb.getEndCount()));
	      
	      ArrayList<HashMap<String, String>> list = iFreeService.getFreeReple(params);
	           
	      modelMap.put("list", list);
	      modelMap.put("pb", pb);
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   	 }
	   
//       자유게시판 상세보기	   
		 @RequestMapping(value="/FreeBoardDetail") //글상세보기
		   public ModelAndView FreeBoardDetail(HttpServletRequest request,
  					@RequestParam HashMap<String, String> params,
  					ModelAndView modelAndView, HttpSession session) throws Throwable{ //db에 붙을때 throws Throwable사용

			  HashMap<String, String> con = iFreeService.getFreeBoardCon(params);
				
			  modelAndView.addObject("con", con);
				
		      modelAndView.setViewName("FreeBoard/FreeBoardDetail");
		      
		      return  modelAndView;
		      
		  }
		 
//		       자유게시판 글추가
		   @RequestMapping(value = "/InsertFreeBoard")
		   public @ResponseBody ResponseEntity<String> InsertFreeBoard(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      String res = iFreeService.FreeBoardAdd(params);
		      
		      modelMap.put("res", res);
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   
//         댓글추가		   
		   @RequestMapping(value = "/InsertFreeReple")
		   public @ResponseBody ResponseEntity<String> InsertFreeReple(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      String res = iFreeService.FreeRepleAdd(params);
		      
		      modelMap.put("res", res);
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   
//         게시판 수정 		   
		   @RequestMapping(value = "/updateFreeBoard")
		   public @ResponseBody ResponseEntity<String> updateFreeBoard(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iFreeService.updateFreeBoard(params);
		      
		      modelMap.put("res", res);
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   
		   @RequestMapping(value = "/DeleteFreeBoard")
		   public @ResponseBody ResponseEntity<String> DeleteFreeBoard(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iFreeService.DeleteFreeBoard(params);
		      
		      modelMap.put("res", res);
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   
		   @RequestMapping(value = "/FreeBoardLookUp")
		   public @ResponseBody ResponseEntity<String> FreeBoardLookUp(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iFreeService.FreeBoardLookUp(params);
		      
		      modelMap.put("res", res);
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   
		   @RequestMapping(value = "/RepleDelete")
		   public @ResponseBody ResponseEntity<String> RepleDelete(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iFreeService.RepleDelete(params);
		      
		      modelMap.put("res", res);
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		 


}
