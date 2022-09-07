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
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	HttpSession session;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home(Model m) {
		User user = (User) session.getAttribute("user");
		m.addAttribute("user",user);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		m.addAttribute("loginTime", dtf.format(LocalDateTime.now()));  
		return "cust-home";
	}
	
	@RequestMapping(value="/account")
	public String account() {
		return "cust-account";
	}
	
	@RequestMapping(value="/fund-transfer/own")
	public String fundTransferToOwn() {
		return "cust-fund-transfer-own";
	}
	
	@RequestMapping(value="/fund-transfer/others")
	public String fundTransferToOthers() {
		return "cust-fund-transfer-others";
	}
	
	@RequestMapping(value="/payment/credit-card")
	public String creditCardPayment() {
		return "cust-payment-credit-card";
	}
	
	@RequestMapping(value="/payment/loan")
	public String loanPayment() {
		return "cust-payment-loan";
	}
	
	@RequestMapping(value="/profile-management")
	public String profileManagement() {
		return "cust-profile-mgmt";
	}
}
