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
import com.spring.sample.web.Sanipani.service.IAdminService;


@Controller
public class AdminController {
	
	   @Autowired
	   public IAdminService iAdminService;
	   @Autowired
	   public IPagingService iPagingService;
		
	 @RequestMapping(value="/AdminMember") //자유게시판목록 jsp 연결
	   public ModelAndView FreeBoard(HttpServletRequest request,
	                      ModelAndView modelAndView,
	                      HttpSession session){
	      modelAndView.setViewName("spAdmin/AdminMember");
	      return modelAndView;
	      
	   }
	 
	   @RequestMapping(value = "/refreshMemberInfo") //게시판내용가져오기
	   public @ResponseBody ResponseEntity<String> refreshMemberInfo(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iAdminService.getMemberInfoCount(params));
	      
	      params.put("start", Integer.toString(pb.getStartCount()));
	      params.put("end", Integer.toString(pb.getEndCount()));
	      
	      ArrayList<HashMap<String, String>> list = iAdminService.getMemberInfo(params);
	           
	      modelMap.put("list", list);
	      modelMap.put("pb", pb);
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
}