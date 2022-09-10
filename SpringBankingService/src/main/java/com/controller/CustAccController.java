package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Customer;
import com.dao.CustAccDao;

@Controller
@RequestMapping("/customer/account")
public class CustAccController {
	
	@Autowired
	CustAccDao custAccDao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="")
	public String account(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		m.addAttribute("custAccList", custAccDao.getCustAccountsByCust(cust));
		return "cust-account";
	}
	
	@RequestMapping(value="/{accNum}/summary")
	public String viewAccount(@PathVariable String accNum, Model m) {
		return "cust-account-summary";
	}
	
	@RequestMapping(value="/{accNum}/transactions")
	public String viewTransactions(@PathVariable String accNum, Model m) {
		return "cust-account-transactions";
	}
}
