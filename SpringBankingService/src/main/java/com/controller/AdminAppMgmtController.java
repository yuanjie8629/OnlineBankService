package com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.AccountApplication;
import com.bean.Address;
import com.bean.CreditCardApplication;
import com.bean.CustAccount;
import com.bean.CustCreditCard;
import com.bean.CustLoan;
import com.bean.Customer;
import com.bean.LoanApplication;
import com.dao.AccountAppDao;
import com.dao.CreditCardAppDao;
import com.dao.CustAccDao;
import com.dao.CustCreditCardDao;
import com.dao.CustLoanDao;
import com.dao.CustomerDao;
import com.dao.LoanAppDao;

@Controller
@RequestMapping("/admin/application-management")
public class AdminAppMgmtController {
	@Autowired
	AccountAppDao accAppDao;

	@Autowired
	CreditCardAppDao creditCardAppDao;

	@Autowired
	LoanAppDao loanAppDao;

	@Autowired
	CustomerDao custDao;

	@Autowired
	CustAccDao custAccDao;

	@Autowired
	CustCreditCardDao custCreditCardDao;
	
	@Autowired
	CustLoanDao custLoanDao;

	@RequestMapping(value = "")
	public String applicationManagement() {
		return "admin-app-mgmt";
	}
	
	//Account
	
	@RequestMapping(value = "/account")
	public String accountApplicationManagement(@RequestParam(required = false) String status, Model m) {
		List<AccountApplication> list;
		if (status != null) {
			list = accAppDao.getAccountApplications(status);
		} else {
			list = accAppDao.getAccountApplications();
		}
		m.addAttribute("accAppList", list);
		return "admin-app-mgmt-acc";
	}

	@RequestMapping(value = "/account/{id}")
	public String viewAccountApplication(@PathVariable String id, Model m) {
		AccountApplication accApp = accAppDao.getAccountApplicationById(id);
		m.addAttribute("accApp", accApp);
		return "admin-app-mgmt-acc-view";
	}

	@Transactional
	@RequestMapping(value = "/account/approve", method = RequestMethod.POST)
	public String approveAccountApplication(@RequestParam String id, @RequestParam double initialBal, Model m,
			RedirectAttributes ra) {
		AccountApplication accApp = accAppDao.getAccountApplicationById(id);
		Customer customer = custDao.getCustomerByIdentityNum(accApp.getIdentityNumber());
		if (customer == null) {
			customer = new Customer();
		}

		Address address = new Address();
		BeanUtils.copyProperties(accApp, customer);
		BeanUtils.copyProperties(accApp, address);
		customer.setAddress(address);
		customer.setStatus("active");
		custDao.save(customer);

		CustAccount custAcc = new CustAccount();
		custAcc.setAccount(accApp.getAccount());
		System.out.println(initialBal);
		custAcc.setCurBal(initialBal);
		System.out.println(custAcc.getCurBal());
		custAcc.setAvailBal(initialBal - accApp.getAccount().getMinAmount());
		custAcc.setStatus("active");
		custAcc.setCustomer(customer);
		custAccDao.save(custAcc);

		accApp.setStatus("Approved");
		accAppDao.update(accApp);
		ra.addFlashAttribute("msg", "You have successfully approved the account application.");
		return "redirect:/admin/application-management/account";
	}

	@RequestMapping(value = "/account/reject", method = RequestMethod.POST)
	public String rejectAccountApplication(@RequestParam String id, @RequestParam String comments, Model m,
			RedirectAttributes ra) {
		AccountApplication accApp = accAppDao.getAccountApplicationById(id);
		accApp.setStatus("Rejected");
		accApp.setComments(comments);
		accAppDao.update(accApp);
		ra.addFlashAttribute("msg", "You have successfully rejected the account application.");
		return "redirect:/admin/application-management/account";
	}

	@RequestMapping(value = "/account/further-action", method = RequestMethod.POST)
	public String furtherActionOnAccountApplication(@RequestParam String id, @RequestParam String comments, Model m,
			RedirectAttributes ra) {
		AccountApplication accApp = accAppDao.getAccountApplicationById(id);
		accApp.setStatus("Further Action");
		accApp.setComments(comments);
		accAppDao.update(accApp);
		ra.addFlashAttribute("msg", "You have successfully update the status on the account application.");
		return "redirect:/admin/application-management/account";
	}

	@RequestMapping(value = "/account/{id}/identity-doc")
	@ResponseBody
	public HttpEntity<byte[]> getAccAppIdentityDoc(@PathVariable String id) {
		AccountApplication accApp = accAppDao.getAccountApplicationById(id);
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_PDF);
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + accApp.getName().replace(" ", "") + "_identityDoc.pdf");
		header.setContentLength(accApp.getIdentityDoc().length);
		return new HttpEntity<byte[]>(accApp.getIdentityDoc(), header);
	}
	
	// Card

	@RequestMapping(value = "/card")
	public String creditCardApplicationManagement(@RequestParam(required = false) String status, Model m) {
		List<CreditCardApplication> list;
		if (status != null) {
			list = creditCardAppDao.getCreditCardApplications(status);
		} else {
			list = creditCardAppDao.getCreditCardApplications();
		}
		m.addAttribute("cardAppList", list);
		return "admin-app-mgmt-card";
	}

	@RequestMapping(value = "/card/{id}")
	public String viewCreditCardApplication(@PathVariable String id, Model m) {
		CreditCardApplication cardApp = creditCardAppDao.getCreditCardApplicationById(id);
		m.addAttribute("cardApp", cardApp);
		if (!m.containsAttribute("custCard")) {
			CustCreditCard custCard = new CustCreditCard();
			custCard.setCreditLimit(cardApp.getCreditLimit());
			m.addAttribute("custCard", custCard);
		}
		return "admin-app-mgmt-card-view";
	}

	@Transactional
	@RequestMapping(value = "/card/approve", method = RequestMethod.POST)
	public String approveCreditCardApplication(@Valid @ModelAttribute("custCard") CustCreditCard custCard,
			BindingResult br, @RequestParam String appId, Model m, RedirectAttributes ra) {
		CreditCardApplication creditCardApp = creditCardAppDao.getCreditCardApplicationById(appId);
		if (!br.hasErrors()) {
			Customer customer = custDao.getCustomerByIdentityNum(creditCardApp.getIdentityNumber());
			if (customer == null) {
				customer = new Customer();
			}

			Address address = new Address();
			BeanUtils.copyProperties(creditCardApp, customer);
			BeanUtils.copyProperties(creditCardApp, address);
			customer.setAddress(address);
			customer.setStatus("active");
			custDao.save(customer);

			BeanUtils.copyProperties(creditCardApp, custCard);
			custCard.setCreditCard(creditCardApp.getCreditCard());
			custCard.setStatus("active");
			custCard.setCustomer(customer);
			custCreditCardDao.save(custCard);

			creditCardApp.setStatus("Approved");
			creditCardAppDao.update(creditCardApp);
			ra.addFlashAttribute("msg", "You have successfully approved the credit card application.");
			return "redirect:/admin/application-management/card/";
		} else {
			ra.addFlashAttribute("org.springframework.validation.BindingResult.custCard", br);
			ra.addFlashAttribute("custCard", custCard);
			ra.addFlashAttribute("approveErr", true);
			return "redirect:/admin/application-management/card/" + appId;
		}
	}

	@RequestMapping(value = "/card/reject", method = RequestMethod.POST)
	public String rejectCreditCardApplication(@RequestParam String id, @RequestParam String comments, Model m,
			RedirectAttributes ra) {
		CreditCardApplication creditCardApp = creditCardAppDao.getCreditCardApplicationById(id);
		creditCardApp.setStatus("Rejected");
		creditCardApp.setComments(comments);
		creditCardAppDao.update(creditCardApp);
		ra.addFlashAttribute("msg", "You have successfully rejected the credit card application.");
		return "redirect:/admin/application-management/card";
	}

	@RequestMapping(value = "/card/further-action", method = RequestMethod.POST)
	public String furtherActionOnCreditCardApplication(@RequestParam String id, @RequestParam String comments, Model m,
			RedirectAttributes ra) {
		CreditCardApplication creditCardApp = creditCardAppDao.getCreditCardApplicationById(id);
		creditCardApp.setStatus("Further Action");
		creditCardApp.setComments(comments);
		creditCardAppDao.update(creditCardApp);
		ra.addFlashAttribute("msg", "You have successfully update the status on the credit card application.");
		return "redirect:/admin/application-management/card";
	}

	@RequestMapping(value = "/card/{id}/identity-doc")
	@ResponseBody
	public HttpEntity<byte[]> getCreditCardAppIdentityDoc(@PathVariable String id) {
		CreditCardApplication creditCardApp = creditCardAppDao.getCreditCardApplicationById(id);
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_PDF);
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + creditCardApp.getName().replace(" ", "") + "_identityDoc.pdf");
		header.setContentLength(creditCardApp.getIdentityDoc().length);
		return new HttpEntity<byte[]>(creditCardApp.getIdentityDoc(), header);
	}

	@RequestMapping(value = "/card/{id}/payslip-doc")
	@ResponseBody
	public HttpEntity<byte[]> getCreditCardAppPayslipDoc(@PathVariable String id) {
		CreditCardApplication creditCardApp = creditCardAppDao.getCreditCardApplicationById(id);
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_PDF);
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + creditCardApp.getName().replace(" ", "") + "_payslipDoc.pdf");
		header.setContentLength(creditCardApp.getPayslipDoc().length);
		return new HttpEntity<byte[]>(creditCardApp.getPayslipDoc(), header);
	}
	
	// Loan

	@RequestMapping(value = "/loan")
	public String loanApplicationManagement(@RequestParam(required = false) String status, Model m) {
		List<LoanApplication> list;
		if (status != null) {
			list = loanAppDao.getLoanApplications(status);
		} else {
			list = loanAppDao.getLoanApplications();
		}
		m.addAttribute("loanAppList", list);
		return "admin-app-mgmt-loan";
	}

	@RequestMapping(value = "/loan/{id}")
	public String viewLoanApplication(@PathVariable String id, Model m) {
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(id);
		m.addAttribute("loanApp", loanApp);
		if (!m.containsAttribute("custLoan")) {
			CustLoan custLoan = new CustLoan();
			BeanUtils.copyProperties(loanApp, custLoan);
			custLoan.setTotalAmount(loanApp.getLoanAmount());
			custLoan.setInterestRate(loanApp.getLoan().getInterestRate() * 100);
			custLoan.setDownpayment(loanApp.getLoan().getDownpayment() * loanApp.getLoanAmount());
			m.addAttribute("custLoan", custLoan);
		}
		return "admin-app-mgmt-loan-view";
	}
	
	@Transactional
	@RequestMapping(value = "/loan/approve", method = RequestMethod.POST)
	public String approveCreditCardApplication(@Valid @ModelAttribute("custLoan") CustLoan custLoan,
			BindingResult br, @RequestParam String appId, Model m, RedirectAttributes ra) {
		custLoan.setInterestRate(custLoan.getInterestRate() / 100);
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(appId);
		if (!br.hasErrors()) {
			Customer customer = custDao.getCustomerByIdentityNum(loanApp.getIdentityNumber());
			if (customer == null) {
				customer = new Customer();
			}

			Address address = new Address();
			BeanUtils.copyProperties(loanApp, customer);
			BeanUtils.copyProperties(loanApp, address);
			customer.setAddress(address);
			customer.setStatus("active");
			custDao.save(customer);
			custLoan.setPrincipalBal(custLoan.getTotalAmount() - custLoan.getDownpayment());
			custLoan.setStatus("active");
			custLoan.setLoan(loanApp.getLoan());
			custLoan.setCustomer(customer);
			custLoanDao.save(custLoan);

			loanApp.setStatus("Approved");
			loanAppDao.update(loanApp);
			ra.addFlashAttribute("msg", "You have successfully approved the loan application.");
			return "redirect:/admin/application-management/loan/";
		} else {
			ra.addFlashAttribute("org.springframework.validation.BindingResult.custLoan", br);
			ra.addFlashAttribute("custLoan", custLoan);
			ra.addFlashAttribute("approveErr", true);
			return "redirect:/admin/application-management/loan/" + appId;
		}
	}
	
	@RequestMapping(value = "/loan/reject", method = RequestMethod.POST)
	public String rejectLoanApplication(@RequestParam String id, @RequestParam String comments, Model m,
			RedirectAttributes ra) {
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(id);
		loanApp.setStatus("Rejected");
		loanApp.setComments(comments);
		loanAppDao.update(loanApp);
		ra.addFlashAttribute("msg", "You have successfully rejected the loan application.");
		return "redirect:/admin/application-management/loan";
	}

	@RequestMapping(value = "/loan/further-action", method = RequestMethod.POST)
	public String furtherActionOnLoanApplication(@RequestParam String id, @RequestParam String comments, Model m,
			RedirectAttributes ra) {
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(id);
		loanApp.setStatus("Further Action");
		loanApp.setComments(comments);
		loanAppDao.update(loanApp);
		ra.addFlashAttribute("msg", "You have successfully update the status on the loan application.");
		return "redirect:/admin/application-management/loan";
	}

	@RequestMapping(value = "/loan/{id}/identity-doc")
	@ResponseBody
	public HttpEntity<byte[]> getLoanAppIdentityDoc(@PathVariable String id) {
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(id);
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_PDF);
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + loanApp.getName().replace(" ", "") + "_identityDoc.pdf");
		header.setContentLength(loanApp.getIdentityDoc().length);
		return new HttpEntity<byte[]>(loanApp.getIdentityDoc(), header);
	}

	@RequestMapping(value = "/loan/{id}/payslip-doc")
	@ResponseBody
	public HttpEntity<byte[]> getLoanAppSupportDoc(@PathVariable String id) {
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(id);
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_PDF);
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + loanApp.getName().replace(" ", "") + "_payslipDoc.pdf");
		header.setContentLength(loanApp.getPayslipDoc().length);
		return new HttpEntity<byte[]>(loanApp.getPayslipDoc(), header);
	}
	
	@RequestMapping(value = "/loan/{id}/support-doc")
	@ResponseBody
	public HttpEntity<byte[]> getLoanAppPayslipDoc(@PathVariable String id) {
		LoanApplication loanApp = loanAppDao.getLoanApplicationById(id);
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_PDF);
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + loanApp.getName().replace(" ", "") + "_supportDoc.pdf");
		header.setContentLength(loanApp.getPayslipDoc().length);
		return new HttpEntity<byte[]>(loanApp.getPayslipDoc(), header);
	}
}
