package com.controller;

import java.time.LocalDate;
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
import com.dao.AccountTransactionDao;
import com.dao.CustAccDao;

@Controller
@RequestMapping("/customer/fund-transfer")
public class CustFundTransferController {

	@Autowired
	CustAccDao custAccDao;

	@Autowired
	AccountTransactionDao accTransactionDao;

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
			@RequestParam double amount, @RequestParam(required = false) String description, Model m,
			RedirectAttributes ra) {
		CustAccount custAccFrom = custAccDao.getCustAccountById(accFrom);
		CustAccount custAccTo = custAccDao.getCustAccountById(accTo);
		if (accFrom.equals(accTo)) {
			// Transfer to same account validation
			ra.addFlashAttribute("msg", "Failed to transfer the money. Account transfer from and to cannot be the same.");
		} else if (custAccFrom.getStatus().toLowerCase().equals("inactive")) {
			// Inactive account validation
			ra.addFlashAttribute("msg", "Failed to transfer the money. Your account is inactive.");
		} else {
			// Validate if account has sufficient balance to transfer
			if (amount <= custAccFrom.getAvailBal()) {
				// Update balance for accFrom
				custAccFrom.setAvailBal(custAccFrom.getAvailBal() - amount);
				custAccFrom.setCurBal(custAccFrom.getCurBal() - amount);
				custAccDao.update(custAccFrom);

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
				accTransactionDao.save(accFromTransaction);

				// Update balance for accTo
				custAccTo.setAvailBal(custAccTo.getAvailBal() + amount);
				custAccTo.setCurBal(custAccTo.getCurBal() + amount);
				custAccDao.update(custAccTo);

				// Add transaction for accTo
				AccountTransaction accToTransaction = new AccountTransaction();
				accToTransaction.setType("deposit");
				accToTransaction.setAccount(custAccTo);
				accToTransaction.setAmount(amount);
				accToTransaction.setDescription(description);
				accToTransaction.setReference("Own Account Transfer from " + encryptedAccFrom);
				accToTransaction.setBalance(custAccTo.getAvailBal());
				accToTransaction.setStatus("posted");
				accTransactionDao.save(accToTransaction);

				ra.addFlashAttribute("success", true);
				ra.addFlashAttribute("transaction", accFromTransaction);
				ra.addFlashAttribute("accFrom", encryptedAccFrom);
				ra.addFlashAttribute("accTo", encryptedAccTo);
			} else {
				ra.addFlashAttribute("msg", "Your account available balance is not sufficient for this transaction.");
			}
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
			@RequestParam double amount, @RequestParam(required = false) String description, Model m,
			RedirectAttributes ra) {
		CustAccount custAccFrom = custAccDao.getCustAccountById(accFrom);
		CustAccount custAccTo = custAccDao.getCustAccountById(accTo);
		if (accFrom.equals(accTo)) {
			// Transfer to same account validation
			ra.addFlashAttribute("msg",
					"Failed to transfer the money. Account transfer from and to cannot be the same.");
		} else if (custAccTo == null) {
			// Transfer to invalid account validation
			ra.addFlashAttribute("msg", "Failed to transfer the money. Account to transfer does not exist.");
		} else if (custAccFrom.getStatus().toLowerCase().equals("inactive")) {
			// Inactive account validation
			ra.addFlashAttribute("msg", "Failed to transfer the money. Your account is inactive.");
		} else {
			Customer cust = (Customer) session.getAttribute("user");
			// Validate account's daily fund transfer
			if (accTransactionDao.getTotalTransferAmountByDate(custAccFrom, LocalDate.now()) > 20000) {
				ra.addFlashAttribute("msg", "Failed to transfer the money. Your account has reached the daily fund transfer limit (SGD 20,000).");
			} else if (cust.getAccounts().contains(new CustAccount(accTo))) {
				// Own Account Transfer validation
				ra.addFlashAttribute("msg", "Please proceed to own account transfer.");
			} else {
				// Validate if account has sufficient balance to transfer
				if (amount <= custAccFrom.getAvailBal()) {
					// Update balance for accFrom
					custAccFrom.setAvailBal(custAccFrom.getAvailBal() - amount);
					custAccFrom.setCurBal(custAccFrom.getCurBal() - amount);
					custAccDao.update(custAccFrom);

					// Replace the accNum with * after the 6th accNum digit
					String encryptedAccFrom = accFrom.substring(0, 6)
							+ String.join("", Collections.nCopies(accFrom.length() - 6, "*"));
					String encryptedAccTo = accTo.substring(0, 6)
							+ String.join("", Collections.nCopies(accTo.length() - 6, "*"));

					// Add transaction for accFrom
					AccountTransaction accFromTransaction = new AccountTransaction();
					accFromTransaction.setType("withdraw");
					accFromTransaction.setAccount(custAccFrom);
					accFromTransaction.setAmount(amount);
					accFromTransaction.setDescription(description);
					accFromTransaction.setReference("Online Transfer to " + encryptedAccTo);
					accFromTransaction.setBalance(custAccFrom.getAvailBal());
					accFromTransaction.setStatus("posted");
					accTransactionDao.save(accFromTransaction);

					// Update balance for accTo
					custAccTo.setAvailBal(custAccTo.getAvailBal() + amount);
					custAccTo.setCurBal(custAccTo.getCurBal() + amount);
					custAccDao.update(custAccTo);

					// Add transaction for accTo
					AccountTransaction accToTransaction = new AccountTransaction();
					accToTransaction.setType("deposit");
					accToTransaction.setAccount(custAccTo);
					accToTransaction.setAmount(amount);
					accToTransaction.setDescription(description);
					accToTransaction.setReference("Online Transfer from " + encryptedAccFrom);
					accToTransaction.setBalance(custAccTo.getAvailBal());
					accToTransaction.setStatus("posted");
					accTransactionDao.save(accToTransaction);

					ra.addFlashAttribute("success", true);
					ra.addFlashAttribute("transaction", accFromTransaction);
					ra.addFlashAttribute("accFrom", encryptedAccFrom);
					ra.addFlashAttribute("accTo", encryptedAccTo);
				} else {
					ra.addFlashAttribute("msg", "Your account available balance is not sufficient for this transaction.");
				}
			}
		}
		return "redirect:/customer/fund-transfer/others";
	}
}
