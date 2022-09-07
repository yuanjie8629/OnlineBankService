package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.Account;
import com.bean.Customer;
import com.dao.AccountDao;
import com.dao.CustomerDao;

@Controller
@RequestMapping("/")
public class ProductApplicationController {
	
	@Autowired
	AccountDao accDao;
	
	@Autowired
	CustomerDao custDao;
	
	@RequestMapping(value="/account/checkCust", method=RequestMethod.POST)
	public String checkCust(@RequestParam int id, @RequestParam String identityNum, Model m) {
		Customer cust = custDao.getCustomerByIdentityNum(identityNum);
		Account acc = accDao.getAccountById(id);
		if (cust != null) {
			m.addAttribute("customer", cust);
		}
		m.addAttribute("account", acc);
		return "account-apply";
	}
	
	@RequestMapping("/account/apply/{id}")
	public String applyAccount(@PathVariable int id, Model m) {
		Account acc = accDao.getAccountById(id);
		m.addAttribute("account", acc);
		return "account-apply";
	}
}
