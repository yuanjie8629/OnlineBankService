package com.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.User;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	HttpSession session;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home(Model m) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			m.addAttribute("user",user);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			m.addAttribute("loginTime", dtf.format(LocalDateTime.now()));  
			return "admin-home";
		}
		return "redirect:/";
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
