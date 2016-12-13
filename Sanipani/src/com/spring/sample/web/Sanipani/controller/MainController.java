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
import com.spring.sample.web.Sanipani.service.IAuctionService;
import com.spring.sample.web.Sanipani.service.IMainService;

@Controller
public class MainController {
	   @Autowired
	   public IMainService iMainService;
	   
	   @Autowired
	   public IAuctionService iAuctionService;
	   
	   @Autowired
	   public IPagingService iPagingService;
	   
	
	 @RequestMapping(value="/Mainpage")
	   public ModelAndView Mainpage(HttpServletRequest request,
			   						@RequestParam HashMap<String, String> params,
			   						ModelAndView modelAndView) throws Throwable{
		 
		 modelAndView.setViewName("spmain/Mainpage");// /<<는 경로 ㅋ
	     
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
	    	  session.setAttribute("sGrade", mem.get("GRADE_NO"));
	    	
	      
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
	   
	   @RequestMapping(value="/refreshNotice")
		public @ResponseBody ResponseEntity<String> refreshNotice(
					HttpServletRequest request,
					@RequestParam HashMap<String, String> params, // 여러개의 request.getParameter를 할 필요 없이 한번에 받아옴.
					ModelAndView modelAndView) throws Throwable {
				ObjectMapper mapper = new ObjectMapper();
				Map<String, Object> modelMap = new HashMap<String, Object>();
				
				PagingBean pb = iPagingService.getPageingBean(
						Integer.parseInt(params.get("page")), 
						iMainService.getNoticeCount(params));
				
				params.put("start", Integer.toString(pb.getStartCount()));
				params.put("end", Integer.toString(pb.getEndCount()));

				ArrayList<HashMap<String, String>> list = iMainService.getNotice(params);
				
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				
				HttpHeaders responseHeaders = new HttpHeaders();
				responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				
				return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	   
	   @RequestMapping(value="/MainNoticeDetailLook")
	   public ModelAndView MainNoticeDetailLook(HttpServletRequest request,
							  					HttpSession session,
						   						@RequestParam HashMap<String, String> params,
						   						ModelAndView modelAndView) throws Throwable{
		 HashMap<String, String> con = iMainService.getNoticeCon(params);
			
		 modelAndView.addObject("con", con);
		 
		 modelAndView.setViewName("spmain/MainNoticeDetailLook");
	     
	     return modelAndView;
	   }
	   
	   @RequestMapping(value="/deleteNotice")
		public @ResponseBody ResponseEntity<String> deleteNotice(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params, 
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iMainService.deleteNotice(params);
			
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	   
	   @RequestMapping(value="/NoticeModify")
		public ModelAndView NoticeModify(HttpServletRequest request,
											  HttpSession session,
											  @RequestParam HashMap<String, String> params,
											  ModelAndView modelAndView) throws Throwable {
			HashMap<String, String> con = iMainService.getNoticeCon(params);
			
			modelAndView.addObject("con", con);
			
			modelAndView.setViewName("spmain/NoticeModify");
			
			return modelAndView;
		}
	   
	   @RequestMapping(value="/NoticeWrite")
		public ModelAndView NoticeWrite(HttpServletRequest request,
										 HttpSession session,
										 ModelAndView modelAndView){
			modelAndView.setViewName("spmain/NoticeWrite");
			return modelAndView;
		}
	   
	   @RequestMapping(value="/updateNotice")
		public @ResponseBody ResponseEntity<String> updateNotice(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params, 
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iMainService.updateNotice(params);
			
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	   
	   @RequestMapping(value="/insertNotice")
		public @ResponseBody ResponseEntity<String> insertNotice(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params, 
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String res = iMainService.insertNotice(params);
			
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
}
