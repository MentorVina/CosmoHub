package com.niit.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class indexController{
	
		@RequestMapping(value={"/"}, method = RequestMethod.GET)
		public ModelAndView index(){
			ModelAndView mv = new ModelAndView("home");
			return mv;
		}
	
	
	
		@RequestMapping("/header")
		public String header(){
			System.out.println("In header");
			return "header";
		}
			
	
					
	@RequestMapping("/prodheader")
	public String prodhead(){
		System.out.println("In prodheader");
		return "prodheader";
			}
	@RequestMapping("/footer")
	public String signin(){
		System.out.println("In footer");
		return "footer";
			}
	@RequestMapping("/goTologin")
	public String loginin(){
		System.out.println("Login called");
		return "login";
	}
	
	
	@RequestMapping("/aadmin")
	public String admin(){
		System.out.println("admin added");
		return "adminAdding";
	}
	
	@RequestMapping(value={"/registration"}, method = RequestMethod.GET)
	public ModelAndView reg(){
		ModelAndView mv = new ModelAndView("registration");
		return mv;
	}
	
	
	@RequestMapping("/Contact_us")
	public String contact()
	{
		System.out.println("Contact Us");
		return "contact_us";
	}

}




