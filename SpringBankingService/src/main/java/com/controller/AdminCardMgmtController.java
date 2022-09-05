package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/card-management")
public class AdminCardMgmtController {
	@RequestMapping(value="/add")
	public String showAddACardType() {
		return "admin-card-mgmt-add";
	}
	
	@RequestMapping(value="/update/{id}")
	public String showUpdateCard(@PathVariable int id, Model m) {
		return "admin-card-mgmt-update";
	}
}
