package com.niit.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CartDaoImpl;
import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.SupplierDaoImpl;
import com.niit.DaoImpl.UserDaoImpl;
import com.niit.Model.Cart;
@Controller

public class CartController {
	
	@RequestMapping(value="Thanks_page")
	public String ack()
	{
		return "Thanks_page";
	}
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	@Autowired
	CartDaoImpl cartDaoImpl;
	@Autowired
	UserDaoImpl userDaoImpl;
	
	
	@RequestMapping(value="goToCart")
	public ModelAndView goToCart(HttpServletRequest request)
	{  
		ModelAndView mv=new ModelAndView("cart");
		Principal principal=request.getUserPrincipal();
		String email=principal.getName();
		mv.addObject("carts",cartDaoImpl.findCartByEmailId(email));
		return mv;
	}
	
	@RequestMapping(value="addToCart",method=RequestMethod.GET)
	public ModelAndView addToCart(HttpServletRequest request)
	{   
		
		ModelAndView mv=new ModelAndView("addCart");
		Principal principal=request.getUserPrincipal();
		String email=principal.getName();
		System.out.println(email);
		try {
			String pid=request.getParameter("pid");
			System.out.println(pid);
			int ppid=Integer.parseInt(pid);
			System.out.println(request.getParameter("price"));
			Double price=Double.parseDouble(request.getParameter("price"));
			System.out.println(price);
					int quantity=Integer.parseInt(request.getParameter("quantity"));
					System.out.println(quantity);
			String productname=request.getParameter("pname");
			String imgname=request.getParameter("imgname");
			Cart cartexist=cartDaoImpl.getCartById(ppid,email);
			
			if(cartexist==null)
			{
				Cart cm=new Cart();
				cm.setCartProductID(ppid);
				cm.setCartImages(imgname);
				cm.setCartProductName(productname);
				cm.setCartImages(imgname);
				cm.setCartQuantity(quantity);
				cm.setCartPrice(price*quantity);
				cm.setCartUserDetails(userDaoImpl.getUserById(email));
				cartDaoImpl.insertCart(cm);
				
			}	
			mv.addObject("carts",cartDaoImpl.findCartByEmailId(email));
			
		
		
		}catch(Exception e) {
			
			mv.addObject("carts",cartDaoImpl.findCartByEmailId(email));
		}
			
		return mv;
		
	}

}
