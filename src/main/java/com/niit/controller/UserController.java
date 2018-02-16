package com.niit.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.UserDaoImpl;
import com.niit.Model.User;

@Controller

public class UserController {

	
	
	@Autowired	
	UserDaoImpl userDaoImpl;
	@RequestMapping(value="/saveUser",method=RequestMethod.POST)
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
		    u.setRole("User");
		    u.setEnabled(true);
		    userDaoImpl.insertUser(u);
		    mv.setViewName("registration");
		    return mv;
	}
		       
	
	@RequestMapping("/goTologin")
	public String goToLogin()
	{
		return "login";
	}


}
