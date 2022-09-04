package com.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
    ServletContext servletContext;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home() {
		return "admin-home";
	}
	
}
