package com.controller;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.AccountTransaction;
import com.bean.CustAccount;
import com.bean.Customer;
import com.dao.CustAccDao;

@Controller
@RequestMapping("/customer/fund-transfer")
public class CustFundTransferController {

	@Autowired
	CustAccDao custAccDao;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "")
	public String fundTransfer() {
		return "cust-fund-transfer";
	}
	
	// Own Transfer 
	
	@RequestMapping(value = "/own")
	public String showFundTransferToOwn(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		m.addAttribute("custAccList", custAccDao.getCustAccountsByCust(cust));
		return "cust-fund-transfer-own";
	}

	@RequestMapping(value = "/own/save", method = RequestMethod.POST)
	@Transactional
	public String fundTransferToOwn(@RequestParam String accFrom, @RequestParam String accTo,
			@RequestParam double amount, @RequestParam(required = false) String description, Model m, RedirectAttributes ra) {
		if (!accFrom.equals(accTo)) {
			CustAccount custAccFrom = custAccDao.getCustAccountById(accFrom);
			
			if (amount <= custAccFrom.getAvailBal()) {
				// Update balance for accFrom
				custAccFrom.setAvailBal(custAccFrom.getAvailBal() - amount);
				custAccFrom.setCurBal(custAccFrom.getCurBal() - amount);
				
				
				// Replace the accNum with * after the 6th accNum digit
				String encryptedAccFrom = accFrom.substring(0, 6) + String.join("", Collections.nCopies(accFrom.length() - 6, "*"));
				String encryptedAccTo = accTo.substring(0, 6) + String.join("", Collections.nCopies(accTo.length() - 6, "*"));
				
				// Add transaction for accFrom
				AccountTransaction accFromTransaction = new AccountTransaction();
				accFromTransaction.setType("withdraw");
				accFromTransaction.setAccount(custAccFrom);
				accFromTransaction.setAmount(amount);
				accFromTransaction.setDescription(description);
				accFromTransaction.setReference("Own Account Transfer to " + encryptedAccTo);
				accFromTransaction.setBalance(custAccFrom.getAvailBal());
				accFromTransaction.setStatus("posted");
				
				// Add transaction to the custAcc's transaction list
				custAccFrom.getTransactions().add(accFromTransaction);
				custAccDao.save(custAccFrom);
				
				// Update balance for accTo
				CustAccount custAccTo = custAccDao.getCustAccountById(accTo);
				custAccTo.setAvailBal(custAccTo.getAvailBal() + amount);
				custAccTo.setCurBal(custAccTo.getCurBal() + amount);
				
				// Add transaction for accTo
				AccountTransaction accToTransaction = new AccountTransaction();
				accToTransaction.setType("deposit");
				accToTransaction.setAccount(custAccTo);
				accToTransaction.setAmount(amount);
				accToTransaction.setDescription(description);
				accToTransaction.setReference("Own Account Transfer from " + encryptedAccFrom);
				accToTransaction.setBalance(custAccTo.getAvailBal());
				accToTransaction.setStatus("posted");
				
				// Add transaction to the custAcc's transaction list
				custAccTo.getTransactions().add(accToTransaction);
				custAccDao.save(custAccTo);
				
				ra.addFlashAttribute("success", true);
				ra.addFlashAttribute("transaction", accFromTransaction);
				ra.addFlashAttribute("accFrom", encryptedAccFrom);
				ra.addFlashAttribute("accTo", encryptedAccTo);
			} else {
				ra.addFlashAttribute("msg","Your account available balance is not sufficient for this transaction.");
			}
		} else {
			ra.addFlashAttribute("msg","Failed to transfer the money. Account transfer from and to cannot be the same.");
		}
		return "redirect:/customer/fund-transfer/own";
	}
	
	// Transfer to Others

	@RequestMapping(value = "/others")
	public String showFundTransferToOthers(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		m.addAttribute("custAccList", custAccDao.getCustAccountsByCust(cust));
		return "cust-fund-transfer-others";
	}
	
	@RequestMapping(value = "/others/save", method = RequestMethod.POST)
	@Transactional
	public String fundTransferToOthers(@RequestParam String accFrom, @RequestParam String accTo,
			@RequestParam double amount, @RequestParam(required = false) String description, Model m, RedirectAttributes ra) {
		CustAccount custAccTo = custAccDao.getCustAccountById(accTo);
		if (accFrom.equals(accTo)) {
			ra.addFlashAttribute("msg","Failed to transfer the money. Account transfer from and to cannot be the same.");
		} else if (custAccTo == null) {
			ra.addFlashAttribute("msg","Failed to transfer the money. Account to transfer does not exist.");
		} else {
			Customer cust = (Customer) session.getAttribute("user");
			
			if (cust.getAccounts().contains(new CustAccount(accTo))) {
				ra.addFlashAttribute("msg","Please proceed to own account transfer.");
			} else {
				CustAccount custAccFrom = custAccDao.getCustAccountById(accFrom);
				if (amount <= custAccFrom.getAvailBal()) {
					// Update balance for accFrom
					custAccFrom.setAvailBal(custAccFrom.getAvailBal() - amount);
					custAccFrom.setCurBal(custAccFrom.getCurBal() - amount);
					
					
					// Replace the accNum with * after the 6th accNum digit
					String encryptedAccFrom = accFrom.substring(0, 6) + String.join("", Collections.nCopies(accFrom.length() - 6, "*"));
					String encryptedAccTo = accTo.substring(0, 6) + String.join("", Collections.nCopies(accTo.length() - 6, "*"));
					
					// Add transaction for accFrom
					AccountTransaction accFromTransaction = new AccountTransaction();
					accFromTransaction.setType("withdraw");
					accFromTransaction.setAccount(custAccFrom);
					accFromTransaction.setAmount(amount);
					accFromTransaction.setDescription(description);
					accFromTransaction.setReference("Online Transfer to " + encryptedAccTo);
					accFromTransaction.setBalance(custAccFrom.getAvailBal());
					accFromTransaction.setStatus("posted");
					
					// Add transaction to the custAcc's transaction list
					custAccFrom.getTransactions().add(accFromTransaction);
					custAccDao.save(custAccFrom);
					
					// Update balance for accTo
					custAccTo.setAvailBal(custAccTo.getAvailBal() + amount);
					custAccTo.setCurBal(custAccTo.getCurBal() + amount);
					
					// Add transaction for accTo
					AccountTransaction accToTransaction = new AccountTransaction();
					accToTransaction.setType("deposit");
					accToTransaction.setAccount(custAccTo);
					accToTransaction.setAmount(amount);
					accToTransaction.setDescription(description);
					accToTransaction.setReference("Online Transfer from " + encryptedAccFrom);
					accToTransaction.setBalance(custAccTo.getAvailBal());
					accToTransaction.setStatus("posted");
					
					// Add transaction to the custAcc's transaction list
					custAccTo.getTransactions().add(accToTransaction);
					custAccDao.save(custAccTo);
					
					ra.addFlashAttribute("success", true);
					ra.addFlashAttribute("transaction", accFromTransaction);
					ra.addFlashAttribute("accFrom", encryptedAccFrom);
					ra.addFlashAttribute("accTo", encryptedAccTo);
				} else {
					ra.addFlashAttribute("msg","Your account available balance is not sufficient for this transaction.");
				}
			}
		}
		return "redirect:/customer/fund-transfer/others";
	}
}
