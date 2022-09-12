package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.CustAccount;
import com.bean.Customer;
import com.dao.AccountTransactionDao;
import com.dao.CustAccDao;

@Controller
@RequestMapping("/customer/account")
public class CustAccController {

	@Autowired
	CustAccDao custAccDao;
	
	@Autowired
	AccountTransactionDao accTransactionDao;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "")
	public String account(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		m.addAttribute("custAccList", custAccDao.getCustAccountsByCust(cust));
		return "cust-account";
	}

	@RequestMapping(value = "/summary/{accNum}")
	public String viewAccSummary(@PathVariable String accNum, Model m, RedirectAttributes ra) {
		Customer cust = (Customer) session.getAttribute("user");
		CustAccount custAcc = custAccDao.getCustAccountByCust(accNum, cust);
		if (custAcc != null) {
			m.addAttribute("custAcc", custAcc);
			return "cust-account-summary";
		}
		ra.addFlashAttribute("msg","Failed to retrieve account information...");
		return "redirect:/customer/account";
	}

	@RequestMapping(value = "/transaction/{accNum}")
	public String viewAccTransaction(@PathVariable String accNum,
			@RequestParam(required = false) String transactionMonth, Model m, RedirectAttributes ra) {
		Customer cust = (Customer) session.getAttribute("user");
		CustAccount custAcc = custAccDao.getCustAccountByCust(accNum, cust);
		if (custAcc != null) {
			// Get this and last 5 months
			Format formatter = new SimpleDateFormat("yyyyMM");
			Calendar c = Calendar.getInstance();
			String[] months = new String[6];
			for (int i = 0; i < months.length; i++) {
				months[i] = formatter.format(c.getTime());
				// Subtract 1 month
				c.add(Calendar.MONTH, -1);
			}
			
			if (transactionMonth == null) {
				transactionMonth = months[0];
			}
			
			m.addAttribute("custAcc", custAcc);
			m.addAttribute("transactions", accTransactionDao.getTransactionsByMonth(custAcc, transactionMonth));
			m.addAttribute("months", months);
			return "cust-account-transaction";
		}
		ra.addFlashAttribute("msg","Failed to retrieve account information...");
		return "redirect:/customer/account";
	}
}
