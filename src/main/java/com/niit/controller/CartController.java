package com.niit.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CartDaoImpl;
import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.SupplierDaoImpl;
import com.niit.DaoImpl.UserDaoImpl;
import com.niit.Model.Cart;
import com.niit.Model.Product;
import com.niit.Model.User;
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
	
	
	/*@RequestMapping(value="goToCart")
	public ModelAndView goToCart(HttpServletRequest request)
	{  
		ModelAndView mv=new ModelAndView("addcart");
		Principal principal=request.getUserPrincipal();
		String email=principal.getName();
		mv.addObject("carts",cartDaoImpl.findCartById(email));
		return mv;
	}*/
	
	//add to cart
	
	@RequestMapping(value="addToCart", method=RequestMethod.POST)
	public ModelAndView addtoCart(@RequestParam("pid") String pid,@RequestParam("qty") String qty){
	
		ModelAndView mv = new ModelAndView("redirect:/goToCart");
		
		Product product = productDaoImpl.getProduct(Integer.parseInt(pid));
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		System.out.println(email);
		System.out.println("quant show");
		User user = userDaoImpl.getUserById(email);
		
		//mv.addObject("carts",cartDaoImpl.findCartById(email));
		if(user==null){
			mv.addObject("Products", product);
			mv.addObject("msg","Kindly login first.");
		
			return mv;
		}
		int iqty=Integer.parseInt(qty);
		if(iqty >= product.getStock()){
			mv.addObject("Products", product);
			mv.addObject("msg","Added quentity should be less then stock.");
			return mv;
		}
		Cart cart = new Cart();
		cart.setCartProductID(product.getPid()); 
		if(qty!=null){
			cart.setCartQuantity(iqty);
		}else{
			cart.setCartQuantity(1);
		}
	
		cart.setCartProductName(product.getPname());   
		cart.setCartPrice(product.getPrice());
		cart.setUserEmail(user);
		cart.setCartImages(product.getImagname());
		
		cartDaoImpl.insertCart(cart);
		mv.addObject("Products", product);
		
		mv.addObject("msg","Product "+product.getPname()+" added successful.");
		return mv;
		
	}
	
	
	
	//show all cart
		@RequestMapping(value="goToCart",method=RequestMethod.GET)
		public ModelAndView showCart(){
			ModelAndView mv = new ModelAndView("addCart");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String email = auth.getName();
			User user = userDaoImpl.getUserById(email);
			if(user==null){
				mv.addObject("msg","Kindly login first.");
				return mv;
			}
			List<Cart> cartList = cartDaoImpl.findCartById(String.valueOf(user.getId()));                    // findCartById(String.valueOf(user.getId()));
			mv.addObject("carts",cartList);
			return mv;
		}
		
		//remove cart items 
		
		@RequestMapping(value="/removecartitem",method=RequestMethod.GET)
		public ModelAndView removeCart(@RequestParam("cartId") Integer cartId){
			ModelAndView mv = new ModelAndView("redirect:/goToCart");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String email = auth.getName();
			User user = userDaoImpl.getUserById(email);
			if(user==null){
				mv.addObject("msg","Kindly login first.");
				return mv;
			}
			Cart cart = cartDaoImpl.getCartById(String.valueOf(user.getId()), cartId);
			mv.addObject("msg",cart.getCartProductName()+" removed successful.");
			cartDaoImpl.deleteCart(cart);
			List<Cart> cartList = cartDaoImpl.findCartById(String.valueOf(user.getId()));
			
			mv.addObject("cartList",cartList);
			return mv;
		}
		
		//checkout after shopping
		@RequestMapping(value="/checkout",method=RequestMethod.GET)
		public ModelAndView cartCheckout(@RequestParam("tot") String tot){
			ModelAndView mv = new ModelAndView("checkOut");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String email = auth.getName();
			User user = userDaoImpl.getUserById(email);
			if(user==null){
				mv.addObject("msg","Kindly login first.");
				return mv;
			}
			//List<Cart> cartList = cartDaoImpl.findCartById(String.valueOf(user.getId()));
			/*double total = 0.00;
			for (Cart cart : cartList) {
				total = total + cart.getCartPrice();
				
			}*/
			System.out.println("total");
			double total=Double.parseDouble(tot);
			System.out.println("Total"+ total);
			mv.addObject("total",total);
			mv.addObject("userdetails",user);
			return mv;
		}
}
