package com.niit.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.Model.Category;
import com.niit.Model.Product;
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
	@RequestMapping("/home")
	public String home()
	{
		System.out.println("home");
		return "home";
	}
	
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@ModelAttribute("catlist")
	public List<Category> getCategory(){
		return categoryDaoImpl.getAllCategory();
	}
	

}




