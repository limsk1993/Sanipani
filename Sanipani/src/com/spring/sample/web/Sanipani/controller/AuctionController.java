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
@Controller
public class AuctionController {
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IAuctionService iAuctionService;
	
	@RequestMapping(value="/AuctionBoard")
		public ModelAndView AuctionBoard(HttpServletRequest request,
										 HttpSession session,
										 ModelAndView modelAndView){
			modelAndView.setViewName("spAuctionBoard/AuctionBoard");
			return modelAndView;
	}
	 
	@RequestMapping(value="/refreshAuction")
	public @ResponseBody ResponseEntity<String> refreshAuction(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params, // 여러개의 request.getParameter를 할 필요 없이 한번에 받아옴.
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			PagingBean pb = iPagingService.getPageingBean(
					Integer.parseInt(params.get("page")), 
					iAuctionService.getAuctionCount(params));
			
			params.put("start", Integer.toString(pb.getStartCount()));
			params.put("end", Integer.toString(pb.getEndCount()));

			ArrayList<HashMap<String, String>> list = iAuctionService.getAuction(params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
			
			return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
		}
	
	@RequestMapping(value="/AuctionWrite")
	public ModelAndView AuctionWrite(HttpServletRequest request,
									 HttpSession session,
									 ModelAndView modelAndView){
		modelAndView.setViewName("spAuctionBoard/AuctionWrite");
		return modelAndView;
	}
	
	@RequestMapping(value="/insertAuction")
	public @ResponseBody ResponseEntity<String> insertAuction(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String res = iAuctionService.insertAuction(params);
		int auctionNum = iAuctionService.getAuctionNo();
		params.put("auctionNum", Integer.toString(auctionNum));
		String respicture = iAuctionService.insertAuctionPicture(params);
		
		modelMap.put("res", res);
		modelMap.put("respicture", respicture);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/AuctionDetailLook")
	public ModelAndView AuctionDetailLook(HttpServletRequest request,
										  HttpSession session,
										  @RequestParam HashMap<String, String> params,
										  ModelAndView modelAndView) throws Throwable {
		HashMap<String, String> con = iAuctionService.getAuctionCon(params);
		
		modelAndView.addObject("con", con);
		
		modelAndView.setViewName("spAuctionBoard/AuctionDetailLook");
		return modelAndView;
	}
	
	@RequestMapping(value="/updateAuctionPriceRegist")
	public @ResponseBody ResponseEntity<String> updateAuctionPriceRegist(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String res = iAuctionService.updateAuctionPriceRegist(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/updateAuctionAddDate")
	public @ResponseBody ResponseEntity<String> updateAuctionAddDate(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iAuctionService.updateAuctionAddDate(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/updateAuctionEnd")
	public @ResponseBody ResponseEntity<String> updateAuctionEnd(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iAuctionService.updateAuctionEnd(params);
		int res2 = iAuctionService.updateAuctionEnd2(params);
		
		modelMap.put("res", res);
		modelMap.put("res2", res2);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/updateAuctionLookup")
	public @ResponseBody ResponseEntity<String> updateAuctionLookup(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iAuctionService.updateAuctionLookup(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/updateAuctionPriceCancel")
	public @ResponseBody ResponseEntity<String> updateAuctionPriceCancel(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iAuctionService.updateAuctionPriceCancel(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/deleteAuction")
	public @ResponseBody ResponseEntity<String> deleteAuction(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iAuctionService.deleteAuction(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/AuctionModify")
	public ModelAndView AuctionModify(HttpServletRequest request,
										  HttpSession session,
										  @RequestParam HashMap<String, String> params,
										  ModelAndView modelAndView) throws Throwable {
		HashMap<String, String> con = iAuctionService.getAuctionCon(params);
		
		modelAndView.addObject("con", con);
		
		modelAndView.setViewName("spAuctionBoard/AuctionModify");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/updateAuction")
	public @ResponseBody ResponseEntity<String> updateAuction(
			HttpServletRequest request,
			@RequestParam HashMap<String, String> params, 
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int res = iAuctionService.updateAuction(params);
		
		modelMap.put("res", res);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		
		return new ResponseEntity<String>(mapper.writeValueAsString(modelMap), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/AuctionRequest")
	public ModelAndView AuctionRequset(HttpServletRequest request,
										  HttpSession session,
										  @RequestParam HashMap<String, String> params,
										  ModelAndView modelAndView) {
		modelAndView.setViewName("spAuctionBoard/AuctionRequest");
		return modelAndView;
	}
}
