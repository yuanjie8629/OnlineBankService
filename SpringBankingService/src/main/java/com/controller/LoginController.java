package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			if (user instanceof Customer)
				return "redirect:/customer/home";
			else if (user instanceof Admin)
				return "redirect:/admin/home";
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model m,
			RedirectAttributes ra) {
		User user = userDao.login(username, password);
		if (user != null) {
			if (user.getStatus() == null || user.getStatus().equalsIgnoreCase("inactive")) {
				ra.addFlashAttribute("loginMsg", "Your account is inactive. Please contact us.");
			} else {
				session.setAttribute("user", user);
				ra.addFlashAttribute("user", user);
				if (user instanceof Admin)
					return "redirect:/admin/home";
				else if (user instanceof Customer) {
					return "redirect:/customer/home";
				}
			}
		} else {
			ra.addFlashAttribute("loginMsg", "Invalid Username or Password...");
		}
		return "redirect:/login";
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

	@RequestMapping(value = "/register/verification", method = RequestMethod.POST)
	public String verifyRegistration(@RequestParam String identityNumber, @RequestParam String name,
			@RequestParam String email, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerForRegister(identityNumber, name, email);
		if (cust != null) {
			if (cust.getUsername() != null && !cust.getUsername().isEmpty() && cust.getPassword() != null
					&& !cust.getPassword().isEmpty()) {
				ra.addFlashAttribute("msg", "You have already registered. Please login to your account.");
			} else {
				ra.addFlashAttribute("identityNumber", identityNumber);
				ra.addFlashAttribute("verification", true);
			}
		} else {
			ra.addFlashAttribute("msg", "Failed verify your identity...");
			ra.addFlashAttribute("verification", false);
		}
		return "redirect:/register";
	}

	@RequestMapping(value = "/register/save", method = RequestMethod.POST)
	public String saveRegistration(@RequestParam String identityNumber, @RequestParam String username, @RequestParam String password, @RequestParam(required = false) boolean verification,
			RedirectAttributes ra) {
		if (verification) {
			if (userDao.checkUsername(username)) {
				ra.addFlashAttribute("alertMsg", "Username already exists. Please try with another username.");
				ra.addFlashAttribute("identityNumber", identityNumber);
				ra.addFlashAttribute("verification", true);
				return "redirect:/register";
			}
			Customer cust = custDao.getCustomerByIdentityNum(identityNumber);
			if (cust != null) {
				cust.setUsername(username);
				cust.setPassword(password);
				custDao.update(cust);
				ra.addFlashAttribute("msg", "You have successfully registered. You can now login to the OBS Connect.");
				return "redirect:/login";
			}
		}
		ra.addFlashAttribute("msg", "Failed verify your identity...");
		return "redirect:/register";
	}

	@RequestMapping("/forgot-password")
	public String forgotPassword() {
		return "forgotPassword";
	}

	@RequestMapping(value = "/forgot-password/verification", method = RequestMethod.POST)
	public String verifyForgotPassword(@RequestParam String identityNumber, @RequestParam String name,
			@RequestParam String email, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerForRegister(identityNumber, name, email);
		if (cust != null) {
			if (cust.getUsername() == null || cust.getUsername().isEmpty()) {
				ra.addFlashAttribute("msg", "Please register your account first.");
				return "redirect:/login";
			}
			ra.addFlashAttribute("identityNumber", identityNumber);
			ra.addFlashAttribute("verification", true);
		} else {
			ra.addFlashAttribute("msg", "Failed verify your identity...");
			ra.addFlashAttribute("verification", false);
		}
		return "redirect:/forgot-password";
	}

	@RequestMapping(value = "/forgot-password/save", method = RequestMethod.POST)
	public String saveForgotPassword(@RequestParam String identityNumber, @RequestParam String password,
			@RequestParam(required = false) boolean verification, RedirectAttributes ra) {
		if (verification) {
			Customer cust = custDao.getCustomerByIdentityNum(identityNumber);
			if (cust != null) {
				cust.setPassword(password);
				custDao.update(cust);
				ra.addFlashAttribute("msg", "You have successfully changed your password.");
				return "redirect:/login";
			}
		}
		ra.addFlashAttribute("msg", "Failed verify your identity...");
		return "redirect:/forgot-password";
	}
}
