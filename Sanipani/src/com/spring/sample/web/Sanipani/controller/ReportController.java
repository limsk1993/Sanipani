package com.spring.sample.web.Sanipani.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.sample.web.Sanipani.service.IReportService;

@Controller
public class ReportController {
	
	@Autowired
	public IPagingService iPagingService;
	@Autowired
	public IReportService iReportService;
	
	 @RequestMapping(value="/ReportBoard")
	   public ModelAndView ReportBoard(HttpServletRequest request,
	                      			   ModelAndView modelAndView){
	      modelAndView.setViewName("spReportBoard/ReportBoard");	      
	      return modelAndView;	      
	   }
	 
	 @RequestMapping(value = "/DetailRep")
		public ModelAndView DetailRep(HttpServletRequest request, @RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
			
		 HashMap<String, String> con = iReportService.getReportCon(params);
			
			iReportService.updatelook(params);

			modelAndView.addObject("con", con);
			

			modelAndView.setViewName("spReportBoard/DetailRep");
			return modelAndView;
		}
	 
	 @RequestMapping(value="/RefreshReport")
		public @ResponseBody ResponseEntity<String> RefreshReport(
					HttpServletRequest request,
					@RequestParam HashMap<String, String> params, 
					ModelAndView modelAndView) throws Throwable {
				ObjectMapper mapper = new ObjectMapper();
				Map<String, Object> modelMap = new HashMap<String, Object>();
				PagingBean pb = iPagingService.getPageingBean(
						Integer.parseInt(params.get("page")), 
						iReportService.getReportCount(params));
				
				params.put("start", Integer.toString(pb.getStartCount()));
				params.put("end", Integer.toString(pb.getEndCount()));

				ArrayList<HashMap<String, String>> list = iReportService.getReport(params);
				
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				
				HttpHeaders responseHeaders = new HttpHeaders();
				responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				
				return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
			}	 
	 
	 @RequestMapping(value = "/InsRep")
		public ModelAndView InsRep(HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
			modelAndView.setViewName("spReportBoard/InsRep");

			return modelAndView;
		}
	 
	 @RequestMapping(value = "/insertReport")
		public @ResponseBody ResponseEntity<String> insertReport(HttpServletRequest request,
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			String res = iReportService.insertReport(params);

			modelMap.put("res", res);

			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	 
	 @RequestMapping(value = "/ReplyReport")
	 public ModelAndView ReplyReport(HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		 modelAndView.setViewName("spReportBoard/ReplyReport");
		 
		 return modelAndView;
	 }
	 
	 
	 
	 @RequestMapping(value="/RefreshBlackList")
	 public @ResponseBody ResponseEntity<String> RefreshBlackList(
			 HttpServletRequest request,
			 @RequestParam HashMap<String, String> params, 
			 ModelAndView modelAndView) throws Throwable {
		 ObjectMapper mapper = new ObjectMapper();
		 Map<String, Object> modelMap = new HashMap<String, Object>();
		 PagingBean pb = iPagingService.getPageingBean(
				 Integer.parseInt(params.get("page")), 
				 iReportService.getBlackListCount(params));
		 
		 params.put("start", Integer.toString(pb.getStartCount()));
		 params.put("end", Integer.toString(pb.getEndCount()));
		 
		 ArrayList<HashMap<String, String>> list = iReportService.getBlackList(params);
		 
		 modelMap.put("list", list);
		 modelMap.put("pb", pb);
		 
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		 
		 return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	 }
	 
	 @RequestMapping(value="/BlackList")
	 public ModelAndView BlackList(HttpServletRequest request,
			 ModelAndView modelAndView){
		 
		 modelAndView.setViewName("spReportBoard/BlackList");	      
		 return modelAndView;	      
	 }
	 
	 @RequestMapping(value = "/DetailBlk")
		public ModelAndView DetailBlk(HttpServletRequest request, @RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
			HashMap<String, String> con = iReportService.getBlackListCon(params);
			iReportService.updatelook(params);
			modelAndView.addObject("con", con);
			

			modelAndView.setViewName("spReportBoard/DetailBlk");
			return modelAndView;
		}
	 
	 
	 @RequestMapping(value = "/updateReport")
		public @ResponseBody ResponseEntity<String> updateReport(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			int res = iReportService.updateReport(params);

			modelMap.put("res", res);

			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");

			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	 
	 
	 @RequestMapping(value = "/deleteReport")
		public @ResponseBody ResponseEntity<String> deleteTest(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iReportService.deleteReport(params);
			
			modelMap.put("res", res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	 
	 @RequestMapping(value = "/updateWarning")
	 public @ResponseBody ResponseEntity<String> updateWarning(
			 HttpServletRequest request,
			 @RequestParam HashMap<String, String> params,
			 ModelAndView modelAndView) throws Throwable {
		 ObjectMapper mapper = new ObjectMapper();
		 Map<String, Object> modelMap = new HashMap<String, Object>();
		 
		 int res = iReportService.updateWarning(params);			
		 int bres = iReportService.updateBlacklist(params);
		 String BLres = iReportService.insertBlacklist(params);
		 
		 modelMap.put("res", res);
		 modelMap.put("bres", bres);
		 modelMap.put("BLres", BLres);
		 
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		 
		 return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	 }
	 
	 @RequestMapping(value = "/deleteBlackList")
		public @ResponseBody ResponseEntity<String> deleteBlackList(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int res = iReportService.deleteBlackList(params);
			int bdres = iReportService.deleteBlacklist2(params);
			int bd3res = iReportService.deleteBlacklist3(params);
			
			modelMap.put("res", res);
			modelMap.put("bdres", bdres);
			modelMap.put("bd3res", bd3res);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	 
//	 @RequestMapping(value = "/insertReply")
//	 public @ResponseBody ResponseEntity<String> insertReply(HttpServletRequest request,
//			 @RequestParam HashMap<String, String> params, // 한번에 받아와.
//			 // getParameter할필요
//			 // 없어짐.
//			 ModelAndView modelAndView) throws Throwable {
//		 ObjectMapper mapper = new ObjectMapper();
//		 Map<String, Object> modelMap = new HashMap<String, Object>();
//		 
//		 String res = iReportService.insertReply(params);
//		 
//		 modelMap.put("res", res);
//		 
//		 HttpHeaders responseHeaders = new HttpHeaders();
//		 responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
//		 
//		 return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
//	 }
}
