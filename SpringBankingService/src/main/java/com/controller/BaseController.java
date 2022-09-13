package com.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Admin;
import com.bean.Customer;
import com.bean.Feedback;
import com.bean.User;
import com.dao.AccountDao;
import com.dao.CreditCardDao;
import com.dao.FeedbackDao;
import com.dao.LoanDao;

@Controller
@RequestMapping("/")
public class BaseController {
	@Autowired
	HttpSession session;
	
	@Autowired
	AccountDao accDao;
	
	@Autowired
	CreditCardDao creditCardDao;
	
	@Autowired
	LoanDao loanDao;
	
	@Autowired
	FeedbackDao feedbackDao;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home() {
		User user = (User) session.getAttribute("user");
		if (user instanceof Customer)
			return "redirect:customer/home";
		else if (user instanceof Admin)
			return "redirect:admin/home";
		else 
			return "base";
	}
	
	@RequestMapping(value="/about-us")
	public String aboutUs() {
		return "about-us";
	}
	
	@RequestMapping(value="/account")
	public String account(@RequestParam(required = false) String type, Model m) {
		if (type == null) {
			type="saving";
		}
		m.addAttribute("accList", accDao.getAccounts(type));
		return "account";
	}
	
	@RequestMapping(value="/credit-card")
	public String creditCard(Model m) {
		m.addAttribute("cardList", creditCardDao.getCreditCards());
		return "credit-card";
	}
	
	@RequestMapping(value="/loan")
	public String loan(@RequestParam(required = false) String type, Model m) {
		m.addAttribute("loanList", loanDao.getLoans(type));
		return "loan";
	}
	
	@RequestMapping(value="/track-application")
	public String trackApplication() {
		return "track-application";
	}
	
	@RequestMapping(value="/contact-us")
	public String contactUs(Model m) {
		m.addAttribute("feedback", new Feedback());
		return "contact-us";
	}
	
	@RequestMapping(value="/contact-us", method=RequestMethod.POST)
	public String contactUs(@Valid @ModelAttribute("feedback") Feedback feedback, BindingResult br, Model m, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			feedbackDao.save(feedback);
			ra.addFlashAttribute("msg", "Thank you. You have successfully submitted your feedback.");
			return "redirect:/contact-us";
		}
		return "contact-us";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/logo", method=RequestMethod.GET)
//	public Resource getLogo() {
//		return new ServletContextResource(servletContext, "/images/Logo.png");
//	}
}
