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

import com.bean.Account;
import com.bean.Admin;
import com.bean.User;
import com.dao.AdminDao;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	HttpSession session;

	@Autowired
	AdminDao adminDao;

	@RequestMapping(value = { "/", "/home", "/index.jsp" })
	public String home(Model m) {
		User user = (User) session.getAttribute("user");
		m.addAttribute("user", user);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		m.addAttribute("loginTime", dtf.format(LocalDateTime.now()));
		return "admin-home";
	}

	@RequestMapping(value = "/profile-management")
	public String profileManagement(Model m) {
		m.addAttribute("user", (User) session.getAttribute("user"));
		return "admin-profile-mgmt";
	}

	@RequestMapping(value = "/profile-management/save", method = RequestMethod.POST)
	public String updateProfile(@Valid @ModelAttribute("user") Admin user, BindingResult br, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			adminDao.update(user);
			session.setAttribute("user", user);
			ra.addFlashAttribute("msg", "You have successfully updated your profile.");
			return "redirect:/admin/profile-management/";
		}
		return "admin-profile-mgmt";
	}
	
	@RequestMapping(value = "/profile-management/changePass", method=RequestMethod.POST)
	public String changePassword(@RequestParam("id") int id, @RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, Model m, RedirectAttributes ra) {
		Admin admin = adminDao.getAdminById(id);
		if (admin.getPassword().equals(oldPass)) {
			admin.setPassword(newPass);
			adminDao.update(admin);
			ra.addFlashAttribute("msg", "You have successfully changed your password");
			
			return "redirect:/admin/profile-management/";
		} else {
			m.addAttribute("changePassMsg", "Old password does not match.");
			m.addAttribute("user", (User) session.getAttribute("user"));
			return "admin-profile-mgmt";
		}
	}
}
