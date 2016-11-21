package com.spring.sample.web.Sanipani.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class ReportController {
	 @RequestMapping(value="/ReportBoard")
	   public ModelAndView ReportBoard(HttpServletRequest request,
	                      ModelAndView modelAndView){
	      modelAndView.setViewName("spReportBoard/ReportBoard");
	      return modelAndView;
	      
	   }
}
