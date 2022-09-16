package com.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
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

import com.bean.Account;
import com.dao.AccountDao;

@Controller
@RequestMapping("/admin/account-management")
public class AdminAccMgmtController {
	@Autowired
	AccountDao accDao;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}

	@RequestMapping(value = "")
	public String accountManagement(@RequestParam(required = false) String type,
			@RequestParam(required = false, defaultValue = "false") boolean showDeleted, Model m) {
		List<Account> list = accDao.getAccounts(type, showDeleted);
		m.addAttribute("accList", list);
		return "admin-acc-mgmt";
	}

	@RequestMapping(value = "/add")
	public String showAddAccount(Model m) {
		m.addAttribute("account", new Account());
		return "admin-acc-mgmt-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addAccount(@Valid @ModelAttribute("account") Account account, BindingResult br,
			RedirectAttributes ra) {
		if (!br.hasErrors()) {
			account.setInterestRate(account.getInterestRate() / 100);
			accDao.save(account);
			ra.addFlashAttribute("msg", "You have successfully added the account " + account.getTitle() + ".");
			return "redirect:/admin/account-management/";
		}
		return "admin-acc-mgmt-add";
	}

	@RequestMapping(value = "/update/{id}")
	public String showUpdateAccount(@PathVariable int id, Model m) {
		Account acc = accDao.getAccountById(id);
		acc.setInterestRate(acc.getInterestRate() * 100);
		m.addAttribute("account", acc);
		return "admin-acc-mgmt-update";
	}

	@RequestMapping(value = "/update/save", method = RequestMethod.POST)
	public String updateAccount(@Valid @ModelAttribute("account") Account account, BindingResult br,
			RedirectAttributes ra) {
		// Bypass the thumbnail image validation if no new thumbnail image being
		// uploaded
		boolean noUploadThumbnail = false;
		if (account.getThumbnail() == null || account.getThumbnail().length <= 0) {
			Account sameAccObj = accDao.getAccountById(account.getId());
			account.setThumbnail(sameAccObj.getThumbnail());
			noUploadThumbnail = true;
		}

		if (!br.hasErrors() || (br.hasFieldErrors("thumbnail") && noUploadThumbnail)) {
			account.setInterestRate(account.getInterestRate() / 100);
			accDao.update(account);
			ra.addFlashAttribute("msg", "You have successfully updated the account " + account.getTitle() + ".");
			return "redirect:/admin/account-management/";
		}
		return "admin-acc-mgmt-update";
	}

	@RequestMapping(value = "/delete/{id}")
	public String deleteAccount(@PathVariable int id, RedirectAttributes ra) {
		accDao.delete(id);
		ra.addFlashAttribute("msg", "You have successfully deleted the account with ID " + id + ".");
		return "redirect:/admin/account-management/";
	}

	@RequestMapping(value = "/restore/{id}")
	public String restoreAccount(@PathVariable int id, RedirectAttributes ra) {
		accDao.restore(id);
		ra.addFlashAttribute("msg", "You have successfully restored the account with ID " + id + ".");
		return "redirect:/admin/account-management/";
	}
}
