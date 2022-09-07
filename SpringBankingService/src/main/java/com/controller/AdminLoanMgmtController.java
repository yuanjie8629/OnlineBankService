package com.controller;

import java.util.List;

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

import com.bean.Loan;
import com.dao.LoanDao;

@Controller
@RequestMapping("/admin/loan-management")
public class AdminLoanMgmtController {
	@Autowired
	LoanDao loanDao;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}

	@RequestMapping(value = "")
	public String loanManagement(@RequestParam(required = false) String type,
			@RequestParam(required = false) String title,
			@RequestParam(required = false, defaultValue = "false") boolean showDeleted, Model m) {
		List<Loan> list = loanDao.getLoans(type, showDeleted);
		m.addAttribute("loanList", list);
		return "admin-loan-mgmt";
	}

	@RequestMapping(value = "/add")
	public String showAddLoan(Model m) {
		m.addAttribute("loan", new Loan());
		return "admin-loan-mgmt-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addLoan(@Valid @ModelAttribute("loan") Loan loan, BindingResult br, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			loan.setInterestRate(loan.getInterestRate() / 100);
			loan.setDownpayment(loan.getDownpayment() / 100);
			loanDao.save(loan);
			ra.addFlashAttribute("msg", "You have successfully added the loan " + loan.getTitle() + ".");
			return "redirect:/admin/loan-management/";
		}
		return "admin-loan-mgmt-add";
	}

	@RequestMapping(value = "/update/{id}")
	public String showUpdateLoan(@PathVariable int id, Model m) {
		Loan loan = loanDao.getLoanById(id);
		loan.setInterestRate(loan.getInterestRate() * 100);
		loan.setDownpayment(loan.getDownpayment() * 100);
		m.addAttribute("loan", loan);
		return "admin-loan-mgmt-update";
	}

	@RequestMapping(value = "/update/save", method = RequestMethod.POST)
	public String updateLoan(@Valid @ModelAttribute("loan") Loan loan, BindingResult br, RedirectAttributes ra) {
		// Bypass the thumbnail image validation if no new thumbnail image being
		// uploaded
		boolean noUploadThumbnail = false;
		if (loan.getThumbnail() == null || loan.getThumbnail().length <= 0) {
			Loan sameAccObj = loanDao.getLoanById(loan.getId());
			loan.setThumbnail(sameAccObj.getThumbnail());
			noUploadThumbnail = true;
		}

		if (!br.hasErrors() || (br.hasFieldErrors("thumbnail") && noUploadThumbnail)) {
			loan.setInterestRate(loan.getInterestRate() / 100);
			loan.setDownpayment(loan.getDownpayment() / 100);
			loanDao.update(loan);
			ra.addFlashAttribute("msg", "You have successfully updated the loan " + loan.getTitle() + ".");
			return "redirect:/admin/loan-management/";
		}
		return "admin-loan-mgmt-update";
	}

	@RequestMapping(value = "/delete/{id}")
	public String deleteLoan(@PathVariable int id, RedirectAttributes ra) {
		loanDao.delete(id);
		ra.addFlashAttribute("msg", "You have successfully deleted the loan with ID " + id + ".");
		return "redirect:/admin/loan-management/";
	}

	@RequestMapping(value = "/restore/{id}")
	public String restoreLoan(@PathVariable int id, RedirectAttributes ra) {
		loanDao.restore(id);
		ra.addFlashAttribute("msg", "You have successfully restored the loan with ID " + id + ".");
		return "redirect:/admin/loan-management/";
	}
}
