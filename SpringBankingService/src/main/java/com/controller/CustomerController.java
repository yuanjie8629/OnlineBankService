package com.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

import com.bean.Customer;
import com.bean.User;
import com.dao.CustomerDao;
import com.dao.UserDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	HttpSession session;
	
	@Autowired
	CustomerDao custDao;
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value={"/", "/home", "/index.jsp"})
	public String home(Model m) {
		User user = (User) session.getAttribute("user");
		m.addAttribute("user",user);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		m.addAttribute("loginTime", dtf.format(LocalDateTime.now()));  
		return "cust-home";
	}
	
	@RequestMapping(value = "/profile-management")
	public String profileManagement(Model m) {
		m.addAttribute("user", (User) session.getAttribute("user"));
		return "cust-profile-mgmt";
	}

	@RequestMapping(value = "/profile-management/save", method = RequestMethod.POST)
	public String updateProfile(@Valid @ModelAttribute("user") User user, BindingResult br, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			userDao.update(user);
			Customer cust = custDao.getCustomerById(user.getId());
			session.setAttribute("user", cust);
			ra.addFlashAttribute("msg", "You have successfully updated your profile.");
			return "redirect:/customer/profile-management/";
		}
		return "cust-profile-mgmt";
	}
	
	@RequestMapping(value = "/profile-management/change-pass", method=RequestMethod.POST)
	public String changePassword(@RequestParam("id") int id, @RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, Model m, RedirectAttributes ra) {
		Customer cust = custDao.getCustomerById(id);
		if (cust.getPassword().equals(oldPass)) {
			cust.setPassword(newPass);
			custDao.update(cust);
			ra.addFlashAttribute("msg", "You have successfully changed your password");
			
			return "redirect:/customer/profile-management/";
		} else {
			m.addAttribute("changePassMsg", "Old password does not match.");
			m.addAttribute("user", (User) session.getAttribute("user"));
			return "cust-profile-mgmt";
		}
	}
}
