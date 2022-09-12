package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.CustLoan;
import com.bean.Customer;
import com.dao.CustLoanDao;
import com.dao.LoanPaymentDao;


@Controller
@RequestMapping("/customer/loan")
public class CustLoanController {
	@Autowired
	CustLoanDao custLoanDao;
	
	@Autowired
	LoanPaymentDao loanPaymentDao;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "")
	public String creditCard(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		List<CustLoan> custLoanList = custLoanDao.getCustLoansByCust(cust);
		m.addAttribute("custLoanList", custLoanList);
		return "cust-loan";
	}

	@RequestMapping(value = "/summary/{id}")
	public String viewCreditCardSummary(@PathVariable String id, Model m, RedirectAttributes ra) {
		Customer cust = (Customer) session.getAttribute("user");
		CustLoan custLoan = custLoanDao.getCustLoanByCust(id, cust);
		if (custLoan != null) {
			m.addAttribute("custLoan", custLoan);
			return "cust-loan-summary";
		}
		ra.addFlashAttribute("msg", "Failed to retrieve loan information...");
		return "redirect:/customer/loan";
		
	}
}
