package com.controller;

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

import com.bean.User;
import com.dao.UserDao;

@Controller
@RequestMapping("/")
public class LoginController {
	@Autowired
	UserDao dao;
	
	@RequestMapping("/login")
	public String login(@ModelAttribute String msg, Model m) {
		m.addAttribute("msg",msg);
		return "loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model m, RedirectAttributes ra) {
		User user = dao.login(username, password);
		if (user != null) {
			user.setPassword("");
			ra.addFlashAttribute("user", user);
			return "redirect:/homepage";
		} else {
			ra.addFlashAttribute("msg", "Login Failed. Invalid Username or Password...");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register(Model model) {
		User user = new User();
	    model.addAttribute("user", user);
		return "registerform";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user, BindingResult br, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			dao.register(user);
			ra.addFlashAttribute("msg","You have successfully registered.");
			return "redirect:/";
		} else {
			return "registerform";
		}
	}
	
	
}
