package com.niit.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.SupplierDaoImpl;
import com.niit.DaoImpl.UserDaoImpl;
import com.niit.Model.Category;
import com.niit.Model.Supplier;
import com.niit.Model.User;

@Controller

public class UserController {

	
	
	@Autowired	
	UserDaoImpl userDaoImpl;
	
	
	@RequestMapping(value={"/registration"}, method = RequestMethod.GET)
	public ModelAndView reg(){
		ModelAndView mv = new ModelAndView("registration");
		mv.addObject("user", new User());
		return mv;
	}
	
	
	/*@RequestMapping(value="/saveUser",method=RequestMethod.POST)
	public ModelAndView saveUserData(@RequestParam("email") String email,@RequestParam("fname")String fname,@RequestParam("lname")
	     String lname,@RequestParam("dob")String dob,@RequestParam("contact")String contact,@RequestParam("addr")String addr,
	     @RequestParam("pass")String pass)
	{
	
		
			
		    ModelAndView mv=new ModelAndView();
		    System.out.println("In User Controller");
		    User u=new User();
		    u.setEmail(email);
		    u.setFname(fname);
		    u.setLname(lname);
		    u.setDob(dob);
		    u.setContact(contact);
		    u.setAddr(addr);
		    u.setPass(pass);
		    u.setRole("USER");
		    u.setEnabled(true);
		    userDaoImpl.insertUser(u);
		    return mv;
	}
		*/ 
	
	@RequestMapping(value={"/Reguser"}, method=RequestMethod.POST)
	public ModelAndView RegUser(@ModelAttribute("user") User user){
		System.out.println("enter in register user");
		ModelAndView mv = new ModelAndView("login");
		user.setRole("USER");
		user.setEnabled(Boolean.parseBoolean("TRUE"));
		
		userDaoImpl.insertUser(user);
		mv.addObject("msg", "You are successfully registered.");
		return mv;
	}
	
	/*<equestMapping("/userlogged")
	public String goToLogin()
	{
		System.out.println("enter in login page");
		return "home";
	}-->*/
	
	
	@RequestMapping("/userlogged")
	public String goToLogin(@RequestParam(value="error",required=false)String error,@RequestParam(value="logout",required=false)String logout,Model model)
	{
		
		System.out.println("enter in controller");
		if(error!=null)
			model.addAttribute("error", "Invalid email and password");
		
		if(logout!=null)
			model.addAttribute("logout","you have logged out sucessfully");
			
		return "home";
	}
	
	
	
	@RequestMapping("/logout")
	public String logout()
	{
		return "redirect:/home";
	}


	@RequestMapping("/accessDenied")
	public String Error()
	{
		System.out.println("enter in error page");
		return "error";
	}
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	

}
