package com.spring.sample.web.Sanipani.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class AuctionController {
	 @RequestMapping(value="/AuctionBoard")
	   public ModelAndView AuctionBoard(HttpServletRequest request,
	                      ModelAndView modelAndView){
	      modelAndView.setViewName("spAuctionBoard/AuctionBoard");
	      return modelAndView;
	      
	   }
	
}
