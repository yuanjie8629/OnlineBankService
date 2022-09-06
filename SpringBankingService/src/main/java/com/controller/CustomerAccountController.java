package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/account")
public class CustomerAccountController {
	@RequestMapping(value="/{accNum}/summary")
	public String viewAccount(@PathVariable String accNum, Model m) {
		return "cust-account-summary";
	}
	
	@RequestMapping(value="/{accNum}/transactions")
	public String viewTransactions(@PathVariable String accNum, Model m) {
		return "cust-account-transactions";
	}
}
