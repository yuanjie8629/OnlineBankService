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
	
	@RequestMapping(value="/account-management")
	public String accountManagement() {
		return "admin-acc-mgmt";
	}
	
	@RequestMapping(value="/card-management")
	public String cardManagement() {
		return "admin-card-mgmt";
	}
	
	@RequestMapping(value="/loan-management")
	public String loanManagement() {
		return "admin-loan-mgmt";
	}
	
	@RequestMapping(value="/customer-management")
	public String customerManagement() {
		return "admin-cust-mgmt";
	}
	
	@RequestMapping(value="/application-management")
	public String applicationManagement() {
		return "admin-app-mgmt";
	}
	
	@RequestMapping(value="/profile-management")
	public String profileManagement() {
		return "admin-profile-mgmt";
	}
}
