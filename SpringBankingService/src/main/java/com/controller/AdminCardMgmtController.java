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

import com.bean.CreditCard;
import com.dao.CreditCardDao;

@Controller
@RequestMapping("/admin/card-management")
public class AdminCardMgmtController {
	@Autowired
	CreditCardDao cardDao;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
	
	@RequestMapping(value = "")
	public String cardManagement(@RequestParam(required = false, defaultValue = "false") boolean showDeleted, Model m) {
		List<CreditCard> list = cardDao.getCreditCards(showDeleted);
		m.addAttribute("cardList", list);
		return "admin-card-mgmt";
	}
	
	@RequestMapping(value = "/add")
	public String showAddCard(Model m) {
		m.addAttribute("card", new CreditCard());
		return "admin-card-mgmt-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCard(@Valid @ModelAttribute("card") CreditCard card, BindingResult br,
			RedirectAttributes ra) {
		if (!br.hasErrors()) {
			card.setInterestRate(card.getInterestRate() / 100);
			cardDao.save(card);
			ra.addFlashAttribute("msg", "You have successfully added the card " + card.getTitle() + ".");
			return "redirect:/admin/card-management/";
		}
		return "admin-card-mgmt-add";
	}

	@RequestMapping(value = "/update/{id}")
	public String showUpdateCard(@PathVariable int id, Model m) {
		CreditCard card = cardDao.getCreditCardById(id);
		card.setInterestRate(card.getInterestRate() * 100);
		m.addAttribute("card", card);
		return "admin-card-mgmt-update";
	}
	
	@RequestMapping(value = "/update/save", method=RequestMethod.POST)
	public String updateCard(@Valid @ModelAttribute("card") CreditCard card, BindingResult br, RedirectAttributes ra) {
		//	Bypass the thumbnail image validation if no new thumbnail image being uploaded
		boolean noUploadThumbnail = false;
		if (card.getThumbnail() == null || card.getThumbnail().length <= 0) {
			CreditCard sameCardObj = cardDao.getCreditCardById(card.getId());
			card.setThumbnail(sameCardObj.getThumbnail());
			noUploadThumbnail = true;
		}
		
		if (!br.hasErrors() || (br.hasFieldErrors("thumbnail") && noUploadThumbnail)) {
			card.setInterestRate(card.getInterestRate() / 100);
			cardDao.update(card);
			ra.addFlashAttribute("msg", "You have successfully updated the card " + card.getTitle() + ".");
			return "redirect:/admin/card-management/";
		}
		return "admin-card-mgmt-update";
	}

	@RequestMapping(value="/delete/{id}")
	public String deleteCard(@PathVariable int id, RedirectAttributes ra) {
		cardDao.delete(id);
		ra.addFlashAttribute("msg", "You have successfully deleted the card with ID " + id + ".");
		return "redirect:/admin/card-management/";
	}
	
	@RequestMapping(value="/restore/{id}")
	public String restoreCard(@PathVariable int id, RedirectAttributes ra) {
		cardDao.restore(id);
		ra.addFlashAttribute("msg", "You have successfully restored the card with ID " + id + ".");
		return "redirect:/admin/card-management/";
	}
}
