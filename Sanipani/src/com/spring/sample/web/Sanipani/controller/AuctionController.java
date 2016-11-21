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
import com.spring.sample.web.Sanipani.service.IAuctionService;
@Controller
public class AuctionController {
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IAuctionService iAuctionService;
	
	@RequestMapping(value="/AuctionBoard")
		public ModelAndView AuctionBoard(HttpServletRequest request,
										 ModelAndView modelAndView){
			modelAndView.setViewName("spAuctionBoard/AuctionBoard");
			return modelAndView;
	}
	 
	@RequestMapping(value="/refreshTest")
	public @ResponseBody ResponseEntity<String> refreshTest(
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params, // 여러개의 request.getParameter를 할 필요 없이 한번에 받아옴.
				ModelAndView modelAndView) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			//String searchText = request.getParameter("searchText");
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
	
}
