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
import com.dao.UserDao;

@Controller
@RequestMapping("/")
public class LoginController {
	@Autowired
	UserDao userDao;
	
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
			user.setPassword("");
			session.setAttribute("user", user);
			ra.addFlashAttribute("user", user);
			if (user instanceof Admin)
				return "redirect:/admin/home";
			else
				return "redirect:/customer/home";
		} else {
			ra.addFlashAttribute("msg", "Login Failed. Invalid Username or Password...");
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
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register(Model model) {
		User user = new User();
	    model.addAttribute("user", user);
		return "registerform";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") Customer user, BindingResult br, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			userDao.register(user);
			ra.addFlashAttribute("msg","You have successfully registered.");
			return "redirect:/";
		} else {
			return "registerform";
		}
	}
	
	
}
