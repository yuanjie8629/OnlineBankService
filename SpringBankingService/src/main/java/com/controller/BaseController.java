package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Admin;
import com.bean.Customer;
import com.bean.User;

@Controller
@RequestMapping("/")
public class BaseController {
	@Autowired
	HttpSession session;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home() {
		User user = (User) session.getAttribute("user");
		if (user instanceof Customer)
			return "redirect:customer/home";
		else if (user instanceof Admin)
			return "redirect:admin/home";
		else 
			return "base";
	}
	
	@RequestMapping(value="/about-us")
	public String aboutUs() {
		return "about-us";
	}
	
	@RequestMapping(value="/account")
	public String account() {
		return "account";
	}
	
	@RequestMapping(value="/credit-card")
	public String creditCard() {
		return "credit-card";
	}
	
	@RequestMapping(value="/loan")
	public String loan() {
		return "loan";
	}
	
	@RequestMapping(value="/track-application")
	public String trackApplication() {
		return "track-application";
	}
	
	@RequestMapping(value="/contact-us")
	public String contactUs() {
		return "contact-us";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/logo", method=RequestMethod.GET)
//	public Resource getLogo() {
//		return new ServletContextResource(servletContext, "/images/Logo.png");
//	}
}
