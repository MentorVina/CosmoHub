package com.niit.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CartDaoImpl;
import com.niit.DaoImpl.OrderDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.UserDaoImpl;
import com.niit.Model.Cart;
import com.niit.Model.Orders;
import com.niit.Model.User;

@Controller
public class OrdersController {

	@Autowired
	CartDaoImpl cartDaoImpl;
	
	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Autowired
	OrderDaoImpl  orderDaoImpl;
	
	
	
	
	@RequestMapping(value="/invoice",method=RequestMethod.POST)
	public ModelAndView cartInvoice(@RequestParam("option") String option,@RequestParam("tot") Double tot){
		ModelAndView mv = new ModelAndView("Invoice");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDaoImpl.getUserById(email);
		if(user==null){
			mv.addObject("msg","Kindly login first.");
			return mv;
		}
		List<Cart> cartList = cartDaoImpl.findCartById(String.valueOf(user.getId()));
		mv.addObject("carts",cartList);
	
		System.out.println("HELLLLO"); 
	
		//double tot1 = Double.parseDouble("tot");
		 
		int totalQty = 0;
		/*for (Cart cart : cartList) {
			total = total + cart.getCartPrice();;
			totalQty = totalQty + cart.getCartQuantity();
			//cartDaoImpl.deleteCart(cart);
		}*/
		Orders or = new Orders();
		//or.setOrderId(orderId);
	or.setPayment(option);
		or.setTotal(tot);
		or.setUser(user);
		orderDaoImpl.insertOrder(or);
		
		mv.addObject("total",tot);
		mv.addObject("userdetails",user);
		mv.addObject("totalQty", totalQty);
		
	
		
		return mv;
	}
	@RequestMapping(value={"/Thanks_page"}, method = RequestMethod.GET)
	public ModelAndView thanks(){
		ModelAndView mv = new ModelAndView("Thanks_page");
		return mv;
	}
}
