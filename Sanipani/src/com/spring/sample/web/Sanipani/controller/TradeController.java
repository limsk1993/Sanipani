package com.spring.sample.web.Sanipani.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TradeController {
	   
	   @RequestMapping(value="/tradeList")
	   public ModelAndView test9(HttpServletRequest request,
			   					HttpSession session,
			   					ModelAndView modelAndView) {
		
			   modelAndView.setViewName("sptrade/tradeList");
		   
		 
		   
		
		   
		   return modelAndView;
	   }

	

}
