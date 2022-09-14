package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.LoanPayment;
import com.bean.CustLoan;
import com.bean.CustCreditCard;
import com.bean.CustLoan;
import com.bean.CustLoan;
import com.bean.LoanPayment;
import com.dao.CustLoanDao;
import com.dao.LoanPaymentDao;

@Controller
@RequestMapping(value = "/admin/customer-management/loan")
public class AdminCustLoanMgmtController {
	
	@Autowired
	CustLoanDao custLoanDao;
	
	@Autowired
	LoanPaymentDao loanPaymentDao;
	
	
	@RequestMapping(value = "")
	public String customerLoanManagement(@RequestParam(required=false) String status, Model m) {
		List<CustLoan> custLoanList;
		if (status == null)
			custLoanList = custLoanDao.getCustLoans();
		else
			custLoanList = custLoanDao.getCustLoans(status);
		m.addAttribute("custLoanList", custLoanList);
		return "admin-cust-mgmt-loan";
	}
	
	@RequestMapping(value = "/view/{id}")
	public String viewCustLoan(@PathVariable String id, @RequestParam(required = false) String transactionMonth,
			@RequestParam(required = false) String paymentMonth, Model m) {
		CustLoan custLoan = custLoanDao.getCustLoanById(id);

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

		m.addAttribute("custLoan", custLoan);
		m.addAttribute("payments", loanPaymentDao.getPayments(custLoan));
		m.addAttribute("months", months);
		return "admin-cust-mgmt-loan-view";
	}
	
	@RequestMapping(value = "/complete/{id}")
	public String completeCustLoan(@PathVariable String id, Model m, RedirectAttributes ra) {
		CustLoan custLoan = custLoanDao.getCustLoanById(id);
		custLoan.setStatus("completed");
		custLoanDao.update(custLoan);
		ra.addFlashAttribute("msg", "You have successfully mark the loan with ID " + id + " as completed");
		return "redirect:/admin/customer-management/loan";
	}
	
	@RequestMapping(value = "{id}/payment/add")
	public String showAddLoan(@PathVariable int id, Model m) {
		// Get last 6 months
		Format formatter = new SimpleDateFormat("yyyyMM");
		Calendar c = Calendar.getInstance();
		String[] months = new String[6];
		for (int i = 0; i < months.length; i++) {
			// Subtract 1 month
			c.add(Calendar.MONTH, -1);
			months[i] = formatter.format(c.getTime());
		}
		m.addAttribute("months", months);
		return "admin-cust-mgmt-loan-add-payment";
	}
	
	@RequestMapping(value = "{id}/payment/add/select-month", method = RequestMethod.POST)
	public String paymentSelectMonth(@PathVariable String id, @RequestParam String selectedMonth, RedirectAttributes ra) {
		CustLoan custLoan = custLoanDao.getCustLoanById(id);
		// Check if the payment statement already exists
		if (loanPaymentDao.getPaymentsByMonth(custLoan, selectedMonth).size() <= 0) {
			LoanPayment loanPayment = new LoanPayment();

			// Calculate Loan Amount based on EMI formula
			double monthlyInterest = custLoan.getInterestRate() / 12;
			int repaymentMonth = custLoan.getRepaymentPeriod() * 12;
			double mathPower = Math.pow(1 + monthlyInterest, repaymentMonth);
			loanPayment.setAmount(custLoan.getPrincipalBal() * (monthlyInterest * mathPower / (mathPower - 1)));
			loanPayment.setInterestCharged(custLoan.getPrincipalBal() * monthlyInterest);
			loanPayment.setPrincipal(loanPayment.getAmount() - loanPayment.getInterestCharged());
			loanPayment.setBalance(custLoan.getPrincipalBal() - loanPayment.getPrincipal());
			System.out.println(loanPayment.getBalance());
			// Set description
			loanPayment.setDescription("Loan payment for " + selectedMonth);
			// Set default due date which is after 1 month
			loanPayment.setDueDate(LocalDate.now().plusMonths(1));
			loanPayment.setPaymentMonth(selectedMonth);
			loanPayment.setLoan(custLoan);

			ra.addFlashAttribute("loanPayment", loanPayment);
			ra.addFlashAttribute("selectedMonth", selectedMonth);
		} else {
			ra.addFlashAttribute("msg", "The statement for the payment already exists for the selected month.");
		}
		return "redirect:/admin/customer-management/loan/" + id + "/payment/add";
	}
	
	@RequestMapping(value = "/payment/save", method = RequestMethod.POST)
	public String paymentSave(@Valid @ModelAttribute("loanPayment") LoanPayment loanPayment,
			@RequestParam String loanId, BindingResult br, RedirectAttributes ra) {
		CustLoan custLoan = custLoanDao.getCustLoanById(loanId);
		if (!br.hasErrors()) {
			loanPayment.setLoan(custLoan);
			loanPayment.setStatus("Pending");
			loanPaymentDao.save(loanPayment);
			ra.addFlashAttribute("msg", "You have successfully add the payment statement to the loan with ID " + custLoan.getId());
			return "redirect:/admin/customer-management/loan/view/" + custLoan.getId();
		} else {
			ra.addFlashAttribute("msg", "Failed to add the payment..");
			ra.addFlashAttribute("org.springframework.validation.BindingResult.loanPayment", br);
			ra.addFlashAttribute("loanPayment", loanPayment);
			return "redirect:/admin/customer-management/loan/" + custLoan + "/payment/add";
		}
	}
	
	@RequestMapping(value = "payment/update/{id}")
	public String showUpdatePayment(@PathVariable int id, Model m) {
		LoanPayment loanPayment = loanPaymentDao.getPaymentById(id);
		m.addAttribute("loanPayment", loanPayment);
		return "admin-cust-mgmt-loan-update-payment";
	}

	@RequestMapping(value = "payment/update/save", method = RequestMethod.POST)
	public String updatePayment(@Valid @ModelAttribute("loanPayment") LoanPayment loanPayment,
			BindingResult br, @RequestParam String loanId, Model m, RedirectAttributes ra) {
		CustLoan custLoan = custLoanDao.getCustLoanById(loanId);
		if (!br.hasErrors()) {
			loanPayment.setLoan(custLoan);
			loanPayment.setStatus("Pending");
			loanPaymentDao.update(loanPayment);
			ra.addFlashAttribute("msg", "You have successfully updated the loan payment with ID " + loanPayment.getId());
			return "redirect:/admin/customer-management/loan/view/" + loanPayment.getLoan().getId();
		} else {
			m.addAttribute("msg", "Failed to update the payment, please ensure all information are valid.");
			return "admin-cust-mgmt-loan-update-payment";
		}
	}
}
