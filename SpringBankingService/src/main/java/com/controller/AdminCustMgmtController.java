package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/customer-management")
public class AdminCustMgmtController {
	@RequestMapping(value="/view/{id}")
	public String viewCust(@PathVariable int id, Model m) {
		return "admin-cust-mgmt-view";
	}
	
	@RequestMapping(value="/update/{id}")
	public String showUpdateCust(@PathVariable int id, Model m) {
		return "admin-cust-mgmt-update";
	}
}
