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

import com.bean.AccountType;
import com.dao.AccountTypeDao;

@Controller
@RequestMapping("/admin/account-management")
public class AdminAccMgmtController {
	@Autowired
	AccountTypeDao accTypeDao;

	@RequestMapping(value = "")
	public String accountManagement(@RequestParam(required = false) String type,
			@RequestParam(required = false) String title, @RequestParam(required = false) String sort,
			@RequestParam(required = false, defaultValue = "false") boolean showDeleted,
			@RequestParam(required = false, defaultValue = "1") int page, Model m) {
		List<AccountType> list = accTypeDao.getAccountTypes(type, sort, title, showDeleted, page);
		int total = accTypeDao.getAccountTypeCount(type, sort, title, showDeleted);
		m.addAttribute("accList", list);
		m.addAttribute("totalPage", total / 5 + 1);
		return "admin-acc-mgmt";
	}

	@RequestMapping(value = "/add")
	public String showAddAccount(Model m) {
		m.addAttribute("account", new AccountType());
		return "admin-acc-mgmt-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addAccount(@Valid @ModelAttribute("account") AccountType account, BindingResult br,
			RedirectAttributes ra) {
		if (!br.hasErrors()) {
			account.setInterestRate(account.getInterestRate() / 100);
			accTypeDao.save(account);
			ra.addFlashAttribute("isAdded", true);
			return "redirect:add";
		}
		return "admin-acc-mgmt-add";
	}

	@RequestMapping(value = "/update/{id}")
	public String showUpdateAccount(@PathVariable int id, Model m) {
		AccountType acc = accTypeDao.getAccountTypeById(id);
		acc.setInterestRate(acc.getInterestRate() * 100);
		m.addAttribute("account", acc);
		return "admin-acc-mgmt-update";
	}
	
	@RequestMapping(value = "/update/save")
	public String updateAccount(@Valid @ModelAttribute("account") AccountType account, BindingResult br) {
		if (!br.hasErrors()) {
			account.setInterestRate(account.getInterestRate() / 100);
			accTypeDao.update(account);
			return "redirect:update/" + account.getId();
		}
		return "admin-acc-mgmt-update";
	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
}
