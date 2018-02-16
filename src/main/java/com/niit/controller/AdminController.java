package com.niit.controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.SupplierDaoImpl;
import com.niit.Model.Category;
import com.niit.Model.Product;
import com.niit.Model.Supplier;

@Controller
@RequestMapping("/aadmin")
public class AdminController {
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	
	@RequestMapping(value="/saveCat",method=RequestMethod.POST)
	public ModelAndView saveCategoryData(@RequestParam("cid") int cid,@RequestParam("cname")String cname)
	{
		
		String message="success";
		ModelAndView mv=new ModelAndView();
		
		Category c=new Category();
		System.out.println("admin 3");
		
		c.setCid(cid);
		System.out.println("admin 4");
	
		c.setCname(cname);
		System.out.println("admin 4");
		
		categoryDaoImpl.insertCategory(c);
	System.out.println("admin 5");
	System.out.println(message);
		mv.setViewName("adminAdding");
	
		mv.addObject("hellloooo",message);
	
		return mv;
	}
	
	
	@RequestMapping(value="/saveSupp",method=RequestMethod.POST)
	public ModelAndView saveSupplierData(@RequestParam("sid") int sid,@RequestParam("sname")String sname)
	{
		ModelAndView mv=new ModelAndView();
		Supplier s=new Supplier();
		s.setSid(sid);
		s.setSname(sname);
		supplierDaoImpl.insertSupplier(s);
		System.out.println("1 adding");
		mv.setViewName("adminAdding");
		System.out.println("adding");
		
		return mv;
	}
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView adminPage() {
		System.out.println("in adminController constructor");
		ModelAndView mv = new ModelAndView("adminAdding");
		return mv;
	}
	
	
	@RequestMapping(value="/saveProd",method=RequestMethod.POST)
	public ModelAndView saveProduct( @ModelAttribute("product") Product product, BindingResult result, @RequestParam("pimage") MultipartFile file,
			HttpServletRequest req) 
	{

		System.out.println("IN save Product ()");
		
		String filePath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("REAL PATH: "+ filePath);
		
		
		String fileName = file.getOriginalFilename();
		System.out.println("FILE NAME: "+ fileName);
		product.setImagname(fileName);
		try {
			byte[] imageByte = file.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(filePath + "\\resources\\images\\" + fileName));
			System.out.println("NEW PATH: "+ filePath + "\\resources\\images\\" + fileName);
			fos.write(imageByte);
			fos.close();
		} catch (Exception e) {
			System.out.println("Ex in SAVEPROD : "+e);
		}
		
		// SET Category into Product
				System.out.println("SELECTED CATEGORY: "+ req.getParameter("category"));
				Category category = new Category();
				category.setCid(Integer.parseInt(req.getParameter("category")));
				product.setCategory(category);
				
				
				//SET Supplier into Product
				System.out.println("SELECTED SUPPLIER: "+req.getParameter("supplier"));
				Supplier supplier = new Supplier();
				supplier.setSid(Integer.parseInt(req.getParameter("supplier")));
				product.setSupplier(supplier);
				
				productDaoImpl.insertProduct(product); 
				
				ModelAndView mv = new ModelAndView("adminAdding");
				mv.addObject("msg", "Product Added Successfully");
				System.out.println("Product Inserted Successful");
				return mv;
			}
			
			
			// return supplier model to admin page
			@ModelAttribute("supplier")
			public Supplier getSupplier1(){
				return new Supplier();
			}
			
			//return product model to admin page
			@ModelAttribute("product")
			public Product getProduct1(){
				return new Product();
			}
			
			//return category model to admin page
			@ModelAttribute("category")
			public Category getCategory1(){
				return new Category();
			}
			
			
	@ModelAttribute("categoires")
	public List<Category> getCategory(){
		return categoryDaoImpl.getAllCategory();
	}
	
	@ModelAttribute("suppliers")
	public List<Supplier>getSupplier(){
		return supplierDaoImpl.getAllSupplier();
	}
	


}


