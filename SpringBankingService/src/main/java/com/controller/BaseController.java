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
	
	@RequestMapping(value="aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	@RequestMapping(value="contactUs")
	public String contactUs() {
		return "contactUs";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/logo", method=RequestMethod.GET)
//	public Resource getLogo() {
//		return new ServletContextResource(servletContext, "/images/Logo.png");
//	}
}
