package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.CustCreditCard;
import com.dao.CreditCardPaymentDao;
import com.dao.CreditCardTransactionDao;
import com.dao.CustCreditCardDao;

@Controller
@RequestMapping("/admin/customer-management/credit-card")
public class AdminCustCreditCardMgmtController {
	@Autowired
	CustCreditCardDao custCreditCardDao;

	@Autowired
	CreditCardTransactionDao creditCardTransactionDao;

	@Autowired
	CreditCardPaymentDao creditCardPaymentDao;

	@RequestMapping(value = "")
	public String customerCreditCardManagement(@RequestParam(required = false) String status, Model m) {
		List<CustCreditCard> custCreditCardList;
		if (status == null)
			custCreditCardList = custCreditCardDao.getCustCreditCards();
		else
			custCreditCardList = custCreditCardDao.getCustCreditCards(status);
		m.addAttribute("custCreditCardList", custCreditCardList);
		return "admin-cust-mgmt-credit-card";
	}

	@RequestMapping(value = "/view/{id}")
	public String viewCust(@PathVariable int id, @RequestParam(required = false) String transactionMonth,
			@RequestParam(required = false) String paymentMonth, Model m) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		// Remove card pin from all card for safety purpose
		custCreditCard.setPin("");

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
		
		if (paymentMonth == null) {
			paymentMonth = months[0];
		}

		m.addAttribute("custCreditCard", custCreditCard);
		m.addAttribute("transactions", creditCardTransactionDao.getTransactionsByMonth(custCreditCard, transactionMonth));
		m.addAttribute("payments", creditCardPaymentDao.getPaymentsByMonth(custCreditCard, paymentMonth));
		m.addAttribute("months", months);
		return "admin-cust-mgmt-credit-card-view";
	}

	@RequestMapping(value = "/activate/{id}")
	public String activateCustAcc(@PathVariable int id, Model m, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		custCreditCard.setStatus("active");
		custCreditCardDao.update(custCreditCard);
		ra.addFlashAttribute("msg", "You have successfully activated the credit card ending with "
				+ custCreditCard.getCardNum().split(" ")[3]);
		return "redirect:/admin/customer-management/credit-card";
	}

	@RequestMapping(value = "/deactivate/{id}")
	public String deactivateCustAcc(@PathVariable int id, Model m, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		custCreditCard.setStatus("inactive");
		custCreditCardDao.update(custCreditCard);
		ra.addFlashAttribute("msg", "You have successfully deactivate the credit card ending with "
				+ custCreditCard.getCardNum().split(" ")[3]);
		return "redirect:/admin/customer-management/credit-card";
	}
}
