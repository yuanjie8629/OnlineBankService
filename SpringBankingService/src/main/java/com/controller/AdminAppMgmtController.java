package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.AccountApplication;
import com.bean.CreditCardApplication;
import com.bean.LoanApplication;
import com.dao.AccountAppDao;
import com.dao.CreditCardAppDao;
import com.dao.LoanAppDao;

@Controller
@RequestMapping("/admin/application-management")
public class AdminAppMgmtController {
	@Autowired
	AccountAppDao accDao;
	
	@Autowired
	CreditCardAppDao creditCardAppDao;
	
	@Autowired
	LoanAppDao loanAppDao;
	
	@RequestMapping(value = "")
	public String applicationManagement() {
		return "admin-app-mgmt";
	}
	
	@RequestMapping(value="/account")
	public String accountApplicationManagement(@RequestParam(required=false) String status,  Model m) {
		List<AccountApplication> list;
		if (status != null) {
			list = accDao.getAccountApplications(status);
		} else {
			list = accDao.getAccountApplications();
		}
		m.addAttribute("accAppList", list);
		return "admin-app-mgmt-acc";
	}
	
	@RequestMapping(value="/card")
	public String creditCardApplicationManagement(@RequestParam(required=false) String status, Model m) {
		List<CreditCardApplication> list;
		if (status != null) {
			list = creditCardAppDao.getCreditCardApplications(status);
		} else {
			list = creditCardAppDao.getCreditCardApplications();
		}
		m.addAttribute("cardAppList", list);
		return "admin-app-mgmt-card";
	}
	
	@RequestMapping(value="/loan")
	public String loanApplicationManagement(@RequestParam(required=false) String status,Model m) {
		List<LoanApplication> list;
		if (status != null) {
			list = loanAppDao.getLoanApplications(status);
		} else {
			list = loanAppDao.getLoanApplications();
		}
		m.addAttribute("loanAppList", list);
		return "admin-app-mgmt-loan";
	}
}
