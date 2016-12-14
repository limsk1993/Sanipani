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
import com.spring.sample.web.Sanipani.service.ICustomerService;

@Controller
public class CustomerController {
	@Autowired
	public ICustomerService iCustomerService;
   @Autowired
	   public IPagingService iPagingService;
	
	@RequestMapping(value="/CusBoard")
	  public ModelAndView CusBoard(HttpServletRequest request,
			  						HttpSession session,
			  				ModelAndView modelAndView){
		modelAndView.setViewName("Customer/CusBoard");
		return modelAndView;
	}
	   @RequestMapping(value = "/refreshCusBoard")
	   public @ResponseBody ResponseEntity<String> refreshCusBoard(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getTempCount(params));
	      
	      params.put("start", Integer.toString(pb.getStartCount()));
	      params.put("end", Integer.toString(pb.getEndCount()));
	      
	      ArrayList<HashMap<String, String>> list = iCustomerService.getTemp(params);
	           
	      modelMap.put("list", list);
	      modelMap.put("pb", pb);
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   @RequestMapping(value = "/refreshQnaBoard")
	   public @ResponseBody ResponseEntity<String> refreshQnaBoard(
	         HttpServletRequest request,
	         @RequestParam HashMap<String, String> params,
	         ModelAndView modelAndView) throws Throwable {
	      
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap<String, Object>();
	      
	      PagingBean pb2 = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getTempCount2(params));
	      
	      params.put("start", Integer.toString(pb2.getStartCount()));
	      params.put("end", Integer.toString(pb2.getEndCount()));
	      
	      ArrayList<HashMap<String, String>> list2 = iCustomerService.getTemp2(params);
	           
	      modelMap.put("list2", list2);
	      modelMap.put("pb2", pb2);
	            
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
	      
	      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
	                                responseHeaders, HttpStatus.CREATED);   
	   }
	   @RequestMapping(value="/CusBoardetail")
	   public ModelAndView CusBoardetail(HttpServletRequest request,
			   							 HttpSession session,
			   					@RequestParam HashMap<String, String> params,
			   					ModelAndView modelAndView) throws Throwable{ //db에 붙을때 throws Throwable사용
		   
		   HashMap<String, String> con = iCustomerService.getCusdetail(params);
		   
		   modelAndView.addObject("con", con); 
		   
		   modelAndView.setViewName("Customer/CusBoardetail");  
		   
		   return modelAndView;
	   }
	   @RequestMapping(value="/QnABoardetail")
	   public ModelAndView QnABoardetail(HttpServletRequest request,
			   							 HttpSession session,			   
			   					@RequestParam HashMap<String, String> params,
			   					ModelAndView modelAndView) throws Throwable{ //db에 붙을때 throws Throwable사용
		   
		   HashMap<String, String> con = iCustomerService.getQnAdetail(params);
		   
		   modelAndView.addObject("con", con); 
		   
		   modelAndView.setViewName("Customer/QnABoardetail");  
		   
		   return modelAndView;
	   }
	   @RequestMapping(value="/QnAupdate")
	   public @ResponseBody ResponseEntity<String> QnAupdate(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iCustomerService.QnAupdate(params);
		    		  
		      modelMap.put("res", res); //
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);
	}
	   @RequestMapping(value="/Cusupdate")
	   public @ResponseBody ResponseEntity<String> Cusupdate(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iCustomerService.Cusupdate(params);
		    		  
		      modelMap.put("res", res); //
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);
	}
	   @RequestMapping(value="/QnAdelete")
	   public @ResponseBody ResponseEntity<String> QnAdelete(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iCustomerService.QnAdelete(params);
		    		  
		      modelMap.put("res", res); //
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);
	}
	   @RequestMapping(value="/Cusdelete")
	   public @ResponseBody ResponseEntity<String> Cusdelete(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      int res = iCustomerService.Cusdelete(params);
		    		  
		      modelMap.put("res", res); //
		      
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);
	}
		@RequestMapping(value="/QnAlist")
		  public ModelAndView QnAlist(HttpServletRequest request,
				  					  HttpSession session, 
				  				ModelAndView modelAndView){
			modelAndView.setViewName("Customer/QnAlist");
			return modelAndView;
		}
		@RequestMapping(value="/QnABoard")
		  public ModelAndView QnABoard(HttpServletRequest request,
				  					   HttpSession session,
				  				ModelAndView modelAndView){
			modelAndView.setViewName("Customer/QnABoard");
			return modelAndView;
		}
		   @RequestMapping(value = "/QnAlister")
		   public @ResponseBody ResponseEntity<String> QnAlister(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getQnAlister(params));
		      
		      params.put("start", Integer.toString(pb.getStartCount()));
		      params.put("end", Integer.toString(pb.getEndCount()));
		      
		      ArrayList<HashMap<String, String>> list = iCustomerService.getTemp3(params);
		           
		      modelMap.put("list", list);
		      modelMap.put("pb", pb);
		            
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
		   @RequestMapping(value = "/QnABoarder")
		   public @ResponseBody ResponseEntity<String> QnABoarder(
		         HttpServletRequest request,
		         @RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable {
		      
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getQnABoarder(params));
		     
		      params.put("start", Integer.toString(pb.getStartCount()));
		      params.put("end", Integer.toString(pb.getEndCount()));
		      
		      ArrayList<HashMap<String, String>> list = iCustomerService.getTemp4(params);
		           
		      modelMap.put("list", list);
		      modelMap.put("pb", pb);
		            
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
		      
		      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
		                                responseHeaders, HttpStatus.CREATED);   
		   }
			@RequestMapping(value= "/CusWriten")
			  public ModelAndView CusWriten(HttpServletRequest request,
					  						HttpSession session,
					  				ModelAndView modelAndView){
				modelAndView.setViewName("Customer/CusWriten");
				return modelAndView;
			}
			@RequestMapping(value= "/QnAWriten")
			  public ModelAndView QnAWriten(HttpServletRequest request,
					  						HttpSession session,
					  				ModelAndView modelAndView){
				modelAndView.setViewName("Customer/QnAWriten");
				return modelAndView;
			}
			@RequestMapping(value= "/CusFix")
			  public ModelAndView CusFix(HttpServletRequest request,
					  						HttpSession session,
					  				ModelAndView modelAndView){
				modelAndView.setViewName("Customer/CusFix");
				return modelAndView;
			}
			@RequestMapping(value= "/QnAFix")
			  public ModelAndView QnAFix(HttpServletRequest request,
					  						HttpSession session,
					  						@RequestParam HashMap<String, String> params,
					  				ModelAndView modelAndView) throws Throwable{
				   HashMap<String, String> con = iCustomerService.getQnAdetail1(params);
				   
				   modelAndView.addObject("con", con); 
				
				modelAndView.setViewName("Customer/QnAFix");
				return modelAndView;
			}
			   @RequestMapping(value="/QnAinsert")
			   public @ResponseBody ResponseEntity<String> QnAinsert(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      String res = iCustomerService.QnAinsert(params);
				    		  
				      modelMap.put("res", res); //
				      
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);
			}
			   @RequestMapping(value="/Cusinsert")
			   public @ResponseBody ResponseEntity<String> Cusinsert(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      String res = iCustomerService.Cusinsert(params);
				    		  
				      modelMap.put("res", res); //
				      
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);
			}
			   @RequestMapping(value="/Cusreply")
			   public @ResponseBody ResponseEntity<String> Cusreply(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      int res = iCustomerService.Cusreply(params);
				    		  
				      modelMap.put("res", res); //
				      
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);
			}
			   @RequestMapping(value="/QnAlookup")
			   public @ResponseBody ResponseEntity<String> QnAlookup(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      int res = iCustomerService.QnAlookup(params);
				    		  
				      modelMap.put("res", res); //
				      
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);
			}
			   @RequestMapping(value="/Cuslookup")
			   public @ResponseBody ResponseEntity<String> Cuslookup(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      int res = iCustomerService.Cuslookup(params);
				    		  
				      modelMap.put("res", res); //
				      
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);
			}
			   
				@RequestMapping(value= "/Cuscall")
				  public ModelAndView Cuscall(HttpServletRequest request,
						  						HttpSession session,
						  				ModelAndView modelAndView){
					modelAndView.setViewName("Customer/CusCall");
					return modelAndView;
				}
				@RequestMapping(value= "/CusRefund")
				  public ModelAndView CusRefund(HttpServletRequest request,
						  						HttpSession session,
						  				ModelAndView modelAndView){
					modelAndView.setViewName("Customer/CusRefund");
					return modelAndView;
				}
				@RequestMapping(value= "/CusService")
				  public ModelAndView CusService(HttpServletRequest request,
						  						HttpSession session,
						  				ModelAndView modelAndView){
					modelAndView.setViewName("Customer/CusService");
					return modelAndView;
				}
				@RequestMapping(value= "/CusCoupon")
				  public ModelAndView CusCoupon(HttpServletRequest request,
						  						HttpSession session,
						  				ModelAndView modelAndView){
					modelAndView.setViewName("Customer/CusCoupon");
					return modelAndView;
				}
				@RequestMapping(value = "/Refundlist")
				   public @ResponseBody ResponseEntity<String> Refundlist(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getRefundlist(params));
				      
				      params.put("start", Integer.toString(pb.getStartCount()));
				      params.put("end", Integer.toString(pb.getEndCount()));
				      
				      ArrayList<HashMap<String, String>> list = iCustomerService.getRefund(params);
				           
				      modelMap.put("list", list);
				      modelMap.put("pb", pb);
				            
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);   
				   }
				@RequestMapping(value = "/Calllist")
				   public @ResponseBody ResponseEntity<String> Calllist(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getCalllist(params));
				      
				      params.put("start", Integer.toString(pb.getStartCount()));
				      params.put("end", Integer.toString(pb.getEndCount()));
				      
				      ArrayList<HashMap<String, String>> list = iCustomerService.getCall(params);
				           
				      modelMap.put("list", list);
				      modelMap.put("pb", pb);
				            
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);   
				   }
				@RequestMapping(value = "/Couponlist")
				   public @ResponseBody ResponseEntity<String> Couponlist(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getCouponlist(params));
				      
				      params.put("start", Integer.toString(pb.getStartCount()));
				      params.put("end", Integer.toString(pb.getEndCount()));
				      
				      ArrayList<HashMap<String, String>> list = iCustomerService.getCoupon(params);
				           
				      modelMap.put("list", list);
				      modelMap.put("pb", pb);
				            
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);   
				   }
				@RequestMapping(value = "/Servicelist")
				   public @ResponseBody ResponseEntity<String> Servicelist(
				         HttpServletRequest request,
				         @RequestParam HashMap<String, String> params,
				         ModelAndView modelAndView) throws Throwable {
				      
				      ObjectMapper mapper = new ObjectMapper();
				      Map<String, Object> modelMap = new HashMap<String, Object>();
				      
				      PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), iCustomerService.getServicelist(params));
				      
				      params.put("start", Integer.toString(pb.getStartCount()));
				      params.put("end", Integer.toString(pb.getEndCount()));
				      
				      ArrayList<HashMap<String, String>> list = iCustomerService.getService(params);
				           
				      modelMap.put("list", list);
				      modelMap.put("pb", pb);
				            
				      HttpHeaders responseHeaders = new HttpHeaders();
				      responseHeaders.add("Content-Type", "text/json; charset=UTF-8");
				      
				      return new ResponseEntity<String>(mapper.writeValueAsString(modelMap),
				                                responseHeaders, HttpStatus.CREATED);   
				   }

			   
}
