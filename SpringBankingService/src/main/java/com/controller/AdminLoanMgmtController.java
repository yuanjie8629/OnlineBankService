package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/loan-management")
public class AdminLoanMgmtController {
	@RequestMapping(value="/add")
	public String showAddLoanType() {
		return "admin-loan-mgmt-add";
	}
	
	@RequestMapping(value="/update/{id}")
	public String showUpdateLoan(@PathVariable int id, Model m) {
		return "admin-loan-mgmt-update";
	}
}
