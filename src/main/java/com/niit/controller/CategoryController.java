package com.niit.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.SupplierDaoImpl;
import com.niit.Model.Product;
import com.niit.Model.Supplier;

@Controller

public class CategoryController {
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	
	 	@RequestMapping(value="/productdetails",method = RequestMethod.GET) 
	 	public ModelAndView productCustList(@RequestParam("cid") String cid) 
	 		{   
	 		//String cid="88"; 
	 		System.out.println(cid);
	 		int ccid=Integer.parseInt(cid);
	 		ModelAndView mv=new ModelAndView("productdetails"); 
	 	    mv.addObject("prod",productDaoImpl.getProdCid(ccid)); 
	 	     
	 	    return mv; 
	 		 
	 	} 
	 	@RequestMapping(value="/productdisplay",method = RequestMethod.GET) 
	 	 	public ModelAndView productDetails(@RequestParam("pid") String pid) 
	 	 		{   
	 	 		//String cid="88"; 
	 	 		System.out.println(pid); 
	 	 		int ppid=Integer.parseInt(pid); 
	 	 		//Product product=new Product(); 
	 	 		ModelAndView mv=new ModelAndView("productdisplay"); 
	 	 		Product product=productDaoImpl.getProduct(ppid); 
	 	 	    mv.addObject("item",product); 
	 	 	    Supplier supplier=product.getSupplier(); 
	 	 	    mv.addObject("sup",supplier); 
	 	 	     
	 	 	     
	 	 	    return mv; 
	 	 		 
	 	 	} 


}
