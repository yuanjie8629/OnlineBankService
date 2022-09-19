package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.AccountTransaction;
import com.bean.CustAccount;
import com.dao.AccountTransactionDao;
import com.dao.CustAccDao;
import com.service.MailService;

@Controller
@RequestMapping("/admin/customer-management/account")
public class AdminCustAccMgmtController {
	
	@Autowired
	CustAccDao custAccDao;
	
	@Autowired
	AccountTransactionDao accTransactionDao;
	
	@Autowired
	MailService mailService;
	
	@RequestMapping(value="")
	public String custAccManagement(@RequestParam(required=false) String status, Model m) {
		List<CustAccount> custAccList;
		if (status == null)
			custAccList = custAccDao.getCustAccounts();
		else
			custAccList = custAccDao.getCustAccounts(status);
		m.addAttribute("custAccList", custAccList);
		return "admin-cust-mgmt-account";
	}
	
	@RequestMapping(value="/view/{accNum}")
	public String viewCustAcc(@PathVariable String accNum, @RequestParam(required=false) String transactionMonth, Model m) {
		CustAccount custAcc = custAccDao.getCustAccountById(accNum);
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
		
		m.addAttribute("transactions", accTransactionDao.getTransactionsByMonth(custAcc, transactionMonth));
		m.addAttribute("custAcc", custAcc);
		m.addAttribute("months", months);
		return "admin-cust-mgmt-account-view";
	}
	
	@RequestMapping(value="/deposit", method=RequestMethod.POST)
	@Transactional
	public String depositCustAcc(@RequestParam String accNum, @RequestParam double amount, @RequestParam String description, Model m, RedirectAttributes ra) {
		CustAccount custAcc =  custAccDao.getCustAccountById(accNum);
		if (custAcc != null) {
			custAcc.setAvailBal(custAcc.getAvailBal() + amount);
			custAcc.setCurBal(custAcc.getCurBal() + amount);
			
			String encryptedAccNum = accNum.substring(0, 6) + String.join("", Collections.nCopies(accNum.length() - 6, "*"));
			
			// Add transaction for the deposit
			AccountTransaction accTransaction = new AccountTransaction();
			accTransaction.setType("deposit");
			accTransaction.setAccount(custAcc);
			accTransaction.setAmount(amount);
			accTransaction.setDescription(description);
			accTransaction.setReference("Bank Deposit to " + encryptedAccNum);
			accTransaction.setBalance(custAcc.getAvailBal());
			accTransaction.setStatus("posted");

			// Add transaction to the custAcc's transaction list
			custAcc.getTransactions().add(accTransaction);
			custAccDao.save(custAcc);
			
			// Send Email for Deposit
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String subject = "OBS Fund Deposit";
			String msg = "Dear " + custAcc.getCustomer().getName() + ",\n"
							+ "You have successfully deposited your funds.\n"
							+ "Below is the transaction details:\n\n"
							+ "Transaction ID: " + accTransaction.getId() + "\n"
							+ "Transaction Date: " + accTransaction.getDate().format(df) + "\n"
							+ "Transaction Reference: " + accTransaction.getReference() + "\n"
							+ "Transaction Description: " + accTransaction.getDescription() == null || accTransaction.getDescription().isEmpty() ? "NIL" : accTransaction.getDescription() + "\n"
							+ "Amount: " + accTransaction.getAmount() + " SGD"
							+ "\n\nThank you for choosing OBS Bank. We wish you a great day!"
							+ "\n\nCheers,\nOBS Team";
			mailService.sendMail(custAcc.getCustomer().getEmail(), subject, msg);
		
			ra.addFlashAttribute("msg", "You have successfully deposited money to the account " + accNum);
		} else {
			ra.addFlashAttribute("msg", "No account found with the account number " + accNum);
		}
		return "redirect:/admin/customer-management/account";
		
	}
	
	@RequestMapping(value="/withdraw", method=RequestMethod.POST)
	@Transactional
	public String withdrawCustAcc(@RequestParam String accNum, @RequestParam double amount, @RequestParam String description, Model m, RedirectAttributes ra) {
		CustAccount custAcc =  custAccDao.getCustAccountById(accNum);
		if (custAcc != null) {
			custAcc.setAvailBal(custAcc.getAvailBal() - amount);
			custAcc.setCurBal(custAcc.getCurBal() - amount);
			
			String encryptedAccNum = accNum.substring(0, 6) + String.join("", Collections.nCopies(accNum.length() - 6, "*"));
			
			// Add transaction for the deposit
			AccountTransaction accTransaction = new AccountTransaction();
			accTransaction.setType("withdrawal");
			accTransaction.setAccount(custAcc);
			accTransaction.setAmount(amount);
			accTransaction.setDescription(description);
			accTransaction.setReference("Bank Withdrawal from " + encryptedAccNum);
			accTransaction.setBalance(custAcc.getAvailBal());
			accTransaction.setStatus("posted");

			// Add transaction to the custAcc's transaction list
			custAcc.getTransactions().add(accTransaction);
			custAccDao.save(custAcc);
			
			// Send Email for Withdrawal
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String subject = "OBS Fund Withdrawal";
			String msg = "Dear " + custAcc.getCustomer().getName() + ",\n"
							+ "You have successfully withdrawn your funds.\n"
							+ "Below is the transaction details:\n\n"
							+ "Transaction ID: " + accTransaction.getId() + "\n"
							+ "Transaction Date: " + accTransaction.getDate().format(df) + "\n"
							+ "Transaction Reference: " + accTransaction.getReference() + "\n"
							+ "Transaction Description: " + accTransaction.getDescription() == null || accTransaction.getDescription().isEmpty() ? "NIL" : accTransaction.getDescription() + "\n"
							+ "Amount: " + accTransaction.getAmount() + " SGD"
							+ "\n\nThank you for choosing OBS Bank. We wish you a great day!"
							+ "\n\nCheers,\nOBS Team";
			mailService.sendMail(custAcc.getCustomer().getEmail(), subject, msg);
		
			ra.addFlashAttribute("msg", "You have successfully withdrawn money to the account " + accNum);
		} else {
			ra.addFlashAttribute("msg", "No account found with the account number " + accNum);
		}
		return "redirect:/admin/customer-management/account";
	}
	
	@RequestMapping(value="/activate/{accNum}")
	public String activateCustAcc(@PathVariable String accNum, Model m, RedirectAttributes ra) {
		CustAccount custAcc =  custAccDao.getCustAccountById(accNum);
		custAcc.setStatus("active");
		custAccDao.update(custAcc);
		ra.addFlashAttribute("msg", "You have successfully activated the account " + accNum);
		return "redirect:/admin/customer-management/account";
	}
	
	@RequestMapping(value="/deactivate/{accNum}")
	public String deactivateCustAcc(@PathVariable String accNum, Model m, RedirectAttributes ra) {
		CustAccount custAcc =  custAccDao.getCustAccountById(accNum);
		custAcc.setStatus("inactive");
		custAccDao.update(custAcc);
		ra.addFlashAttribute("msg", "You have successfully deactivate the account " + accNum);
		return "redirect:/admin/customer-management/account";
	}
}
