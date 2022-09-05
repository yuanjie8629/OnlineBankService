package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/account-management")
public class AdminAccMgmtController {
	@RequestMapping(value="/add")
	public String showAddAccount() {
		return "admin-acc-mgmt-add";
	}
	
	@RequestMapping(value="/update/{id}")
	public String showUpdateAccount(@PathVariable int id, Model m) {
		return "admin-acc-mgmt-update";
	}
}
