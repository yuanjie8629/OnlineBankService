package com.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.ServletContextResource;

@Controller
@RequestMapping("/")
public class BaseController {
	@Autowired
    ServletContext servletContext;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home() {
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
