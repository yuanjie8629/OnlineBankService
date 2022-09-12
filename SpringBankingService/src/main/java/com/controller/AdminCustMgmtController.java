package com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Customer;
import com.dao.CustomerDao;
import com.utils.SelectionUtils;

@Controller
@RequestMapping("/admin/customer-management")
public class AdminCustMgmtController {
	
	@Autowired
	CustomerDao custDao;
	
	@RequestMapping(value = "")
	public String customerManagement(@RequestParam(required=false) String status, Model m) {
		List<Customer> custList;
		if (status == null)
			custList = custDao.getCustomers();
		else
			custList = custDao.getCustomers(status);
		m.addAttribute("custList", custList);
		return "admin-cust-mgmt";
	}
	
	@RequestMapping(value="/view/{id}")
	public String viewCust(@PathVariable int id, Model m) {
		m.addAttribute("cust", custDao.getCustomerById(id));
		return "admin-cust-mgmt-view";
	}
	
	@RequestMapping(value="/update/{id}")
	public String showUpdateCust(@PathVariable int id, Model m) {
		m.addAttribute("cust", custDao.getCustomerById(id));
		m.addAttribute("salutationList", SelectionUtils.getSalutationSelections());
		m.addAttribute("maritalStatusList", SelectionUtils.getMaritalStatusSelections());
		m.addAttribute("industryList", SelectionUtils.getIndustrySelections());
		m.addAttribute("raceList", SelectionUtils.getRaceSelections());
		m.addAttribute("countryList", SelectionUtils.getCountrySelections());
		m.addAttribute("nationalityList", SelectionUtils.getNationalitySelections());
		return "admin-cust-mgmt-update";
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.POST)
	public String updateCust(@Valid @ModelAttribute("cust") Customer cust, BindingResult br, Model m, RedirectAttributes ra) {
		if (!br.hasErrors()) {
			custDao.update(cust);
			ra.addFlashAttribute("msg", "You have successfully updated " + cust.getName() + "'s details");
			return "redirect:/admin/customer-management/";
		}
		return "admin-cust-mgmt-update";
	}
	
	@RequestMapping(value="/activate/{id}")
	public String activateCust(@PathVariable int id, Model m, RedirectAttributes ra) {
		custDao.activate(id);
		ra.addFlashAttribute("msg", "You have successfully activated the customer with ID " + id);
		return "redirect:/admin/customer-management/";
	}
	
	@RequestMapping(value="/deactivate/{id}")
	public String deactivateCust(@PathVariable int id, Model m, RedirectAttributes ra) {
		custDao.deactivate(id);
		ra.addFlashAttribute("msg", "You have successfully deactivated the customer with ID " + id);
		return "redirect:/admin/customer-management/";
	}
	
	@RequestMapping(value = "/loan")
	public String customerLoanManagement(@RequestParam(required=false) String status, Model m) {
		return "admin-cust-mgmt-loan";
	}
}
