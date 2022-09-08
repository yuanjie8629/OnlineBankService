package com.controller;

import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Account;
import com.bean.AccountApplication;
import com.bean.CreditCard;
import com.bean.CreditCardApplication;
import com.bean.Customer;
import com.bean.Loan;
import com.bean.LoanApplication;
import com.dao.AccountAppDao;
import com.dao.AccountDao;
import com.dao.CreditCardAppDao;
import com.dao.CreditCardDao;
import com.dao.CustomerDao;
import com.dao.LoanAppDao;
import com.dao.LoanDao;

@Controller
@RequestMapping("/")
public class ProductApplicationController {
	
	@Autowired
	AccountDao accDao;
	
	@Autowired
	AccountAppDao accAppDao;
	
	@Autowired
	CreditCardDao creditCardDao;
	
	@Autowired
	CreditCardAppDao creditCardAppDao;
	
	@Autowired
	LoanDao loanDao;
	
	@Autowired
	LoanAppDao loanAppDao;
	
	@Autowired
	CustomerDao custDao;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
	
	// Account Application
	@RequestMapping(value="/account/checkCust", method=RequestMethod.POST)
	public String applyAccountCheckCust(@RequestParam int id, @RequestParam String username, @RequestParam String password, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerByCredentials(username, password);
		if (cust != null) {
			ra.addFlashAttribute("customer", cust);
			return "redirect:/account/apply/" + id; 
		}
		ra.addFlashAttribute("msg", "Invalid username or password..");
		return "redirect:/account";
	}
	
	@RequestMapping("/account/apply/{id}")
	public String showApplyAccount(@PathVariable int id, @ModelAttribute("customer") Customer customer, Model m) {
		AccountApplication application = null;
		if (customer != null) {
			application = new AccountApplication(customer);
		} else {
			application = new AccountApplication();
		}
		Account acc = accDao.getAccountById(id);
		m.addAttribute("application", application);
		m.addAttribute("account", acc);
		return "account-apply";
	}
	
	@RequestMapping(value="/account/apply/{id}", method=RequestMethod.POST)
	public String applyAccount(@PathVariable int id, @Valid @ModelAttribute("application") AccountApplication application, BindingResult br, Model m, RedirectAttributes ra) {
		Account acc = accDao.getAccountById(id);
		if (!br.hasErrors()) {
			application.setAccount(acc);
			application.setStatus("pending");
			Serializable refNum = accAppDao.save(application);
			ra.addFlashAttribute("appType", "Account");
			ra.addFlashAttribute("title", acc.getTitle());
			ra.addFlashAttribute("refNum", refNum);
			return "redirect:/account";
		} else {
			m.addAttribute("account", acc);
			m.addAttribute("msg", "Failed to submit the account application. Please ensure all information are valid.");
			return "account-apply";
		}
	}
	
	@RequestMapping(value="/credit-card/checkCust", method=RequestMethod.POST)
	public String applyCreditCardCheckCust(@RequestParam int id, @RequestParam String username, @RequestParam String password, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerByCredentials(username, password);
		if (cust != null) {
			ra.addFlashAttribute("customer", cust);
			return "redirect:/credit-card/apply/" + id; 
		}
		ra.addFlashAttribute("msg", "Invalid username or password..");
		return "redirect:/credit-card";
	}
	
	@RequestMapping("/credit-card/apply/{id}")
	public String showApplyCreditCard(@PathVariable int id, @ModelAttribute("customer") Customer customer, Model m) {
		CreditCardApplication application = null;
		if (customer != null) {
			application = new CreditCardApplication(customer);
		} else {
			application = new CreditCardApplication();
		}
		CreditCard creditCard = creditCardDao.getCreditCardById(id);
		m.addAttribute("application", application);
		m.addAttribute("card", creditCard);
		return "credit-card-apply";
	}
	
	@RequestMapping(value="/credit-card/apply/{id}", method=RequestMethod.POST)
	public String applyCreditCard(@PathVariable int id, @Valid @ModelAttribute("application") CreditCardApplication application, BindingResult br, Model m, RedirectAttributes ra) {
		CreditCard creditCard = creditCardDao.getCreditCardById(id);
		if (!br.hasErrors()) {
			application.setCreditCard(creditCard);
			application.setStatus("pending");
			Serializable refNum = creditCardAppDao.save(application);
			ra.addFlashAttribute("appType", "Credit Card");
			ra.addFlashAttribute("title", creditCard.getTitle());
			ra.addFlashAttribute("refNum", refNum);
			return "redirect:/credit-card";
		} else {
			m.addAttribute("card", creditCard);
			m.addAttribute("msg", "Failed to submit the credit card application. Please ensure all information are valid.");
			return "credit-card-apply";
		}
	}
	
	@RequestMapping(value="/loan/checkCust", method=RequestMethod.POST)
	public String applyLoanCheckCust(@RequestParam int id, @RequestParam String username, @RequestParam String password, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerByCredentials(username, password);
		if (cust != null) {
			ra.addFlashAttribute("customer", cust);
			return "redirect:/loan/apply/" + id; 
		}
		ra.addFlashAttribute("msg", "Invalid username or password..");
		return "redirect:/loan";
	}
	
	@RequestMapping("/loan/apply/{id}")
	public String showApplyLoan(@PathVariable int id, @ModelAttribute("customer") Customer customer, Model m) {
		LoanApplication application = null;
		if (customer != null) {
			application = new LoanApplication(customer);
		} else {
			application = new LoanApplication();
		}
		Loan loan = loanDao.getLoanById(id);
		m.addAttribute("application", application);
		m.addAttribute("loan", loan);
		return "loan-apply";
	}
	
	@RequestMapping(value="/loan/apply/{id}", method=RequestMethod.POST)
	public String applyLoan(@PathVariable int id, @Valid @ModelAttribute("application") LoanApplication application, BindingResult br, Model m, RedirectAttributes ra) {
		Loan loan = loanDao.getLoanById(id);
		if (!br.hasErrors()) {
			System.out.println(application.getPayslipDoc().length);
			application.setLoan(loan);
			application.setStatus("pending");
			Serializable refNum = loanAppDao.save(application);
			ra.addFlashAttribute("appType", "Loan");
			ra.addFlashAttribute("title", loan.getTitle());
			ra.addFlashAttribute("refNum", refNum);
			return "redirect:/loan";
		} else {
			m.addAttribute("loan", loan);
			m.addAttribute("msg", "Failed to submit the loan application. Please ensure all information are valid.");
			return "loan-apply";
		}
	}
	
	@RequestMapping(value="/track-application", method=RequestMethod.POST)
	public String trackApplication(@RequestParam String type, @RequestParam String id, @RequestParam String identityNumber, RedirectAttributes ra) {
		if (type.equals("account")) {
			AccountApplication application = accAppDao.trackAccountApplication(id, identityNumber);
			if (application == null) {
				ra.addFlashAttribute("msg", "No application record found");
			} else {
				ra.addFlashAttribute("application", application);
				ra.addFlashAttribute("title", application.getAccount().getTitle());
			}
		} else if (type.equals("creditCard")) {
			CreditCardApplication application = creditCardAppDao.trackCreditCardApplication(id, identityNumber);
			if (application == null) {
				ra.addFlashAttribute("msg", "No application record found");
			} else {
				ra.addFlashAttribute("application", application);
				ra.addFlashAttribute("title", application.getCreditCard().getTitle());
			}
		} else {
			LoanApplication application = loanAppDao.trackLoanApplication(id, identityNumber);
			if (application == null) {
				ra.addFlashAttribute("msg", "No application record found");
			} else {
				ra.addFlashAttribute("application", application);
				ra.addFlashAttribute("title", application.getLoan().getTitle());
			}
		}
		ra.addFlashAttribute("type", type);
		return "redirect:/track-application";
	}
}
