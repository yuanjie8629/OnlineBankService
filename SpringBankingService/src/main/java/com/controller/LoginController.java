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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Admin;
import com.bean.Customer;
import com.bean.User;
import com.dao.CustomerDao;
import com.dao.UserDao;

@Controller
@RequestMapping("/")
public class LoginController {
	@Autowired
	UserDao userDao;
	
	@Autowired
	CustomerDao custDao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/login")
	public String login(Model m) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			if(user instanceof Customer)
				return "redirect:/customer/home";
			else if (user instanceof Admin)
				return "redirect:/admin/home";
		}
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model m, RedirectAttributes ra) {
		User user = userDao.login(username, password);
		if (user != null) {
			session.setAttribute("user", user);
			ra.addFlashAttribute("user", user);
			if (user instanceof Admin)
				return "redirect:/admin/home";
			else
				return "redirect:/customer/home";
		} else {
			ra.addFlashAttribute("loginMsg", "Login Failed. Invalid Username or Password...");
			return "redirect:/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		System.out.println("User logged out...");
		status.setComplete();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping(value="/register/verification", method=RequestMethod.POST)
	public String verifyRegistration(@RequestParam String identityNumber, @RequestParam String name, @RequestParam String email, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerForRegister(identityNumber, name, email);
		if (cust != null) {
			if (cust.getUsername() != null && cust.getPassword() != null) {
				ra.addFlashAttribute("msg", "You have already registered. Please login to your account.");
			} else {
				ra.addFlashAttribute("identityNumber", identityNumber);
				ra.addFlashAttribute("verification", true);
			}
		} else {
			ra.addFlashAttribute("msg", "Failed verify your identity...");
		}
		return "redirect:/register";
	}
	
	@RequestMapping(value="/register/save", method=RequestMethod.POST)
	public String saveRegistration(@RequestParam String identityNumber, @RequestParam String username, @RequestParam String password, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerByIdentityNum(identityNumber);
		if (cust != null) {
			cust.setUsername(username);
			cust.setPassword(password);
			custDao.save(cust);
			ra.addFlashAttribute("msg", "You have successfully registered. You can now login to the OBS Connect.");
			return "redirect:/login";
		} else {
			ra.addFlashAttribute("msg", "Failed verify your identity...");
			return "redirect:/register";
		}
	}
	
	@RequestMapping("/forgot-password")
	public String forgotPassword() {
		return "forgotPassword";
	}
}
