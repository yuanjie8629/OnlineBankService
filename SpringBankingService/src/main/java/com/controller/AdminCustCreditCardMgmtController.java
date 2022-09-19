package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.CreditCardPayment;
import com.bean.CreditCardTransaction;
import com.bean.CustCreditCard;
import com.dao.CreditCardPaymentDao;
import com.dao.CreditCardTransactionDao;
import com.dao.CustCreditCardDao;
import com.service.MailService;

@Controller
@RequestMapping("/admin/customer-management/credit-card")
public class AdminCustCreditCardMgmtController {
	@Autowired
	CustCreditCardDao custCreditCardDao;

	@Autowired
	CreditCardTransactionDao creditCardTransactionDao;

	@Autowired
	CreditCardPaymentDao creditCardPaymentDao;
	
	@Autowired
	MailService mailService;

	@RequestMapping(value = "")
	public String customerCreditCardManagement(@RequestParam(required = false) String status, Model m) {
		List<CustCreditCard> custCreditCardList;
		if (status == null)
			custCreditCardList = custCreditCardDao.getCustCreditCards();
		else
			custCreditCardList = custCreditCardDao.getCustCreditCards(status);
		m.addAttribute("custCreditCardList", custCreditCardList);
		return "admin-cust-mgmt-credit-card";
	}

	@RequestMapping(value = "/view/{id}")
	public String viewCustCreditCard(@PathVariable int id, @RequestParam(required = false) String transactionMonth,
			@RequestParam(required = false) String paymentMonth, Model m) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		// Remove card pin from all card for safety purpose
		custCreditCard.setPin("");

		// Get this and last 5 months
		Format formatter = new SimpleDateFormat("yyyyMM");
		Calendar c = Calendar.getInstance();
		String[] months = new String[6];
		for (int i = 0; i < months.length; i++) {
			months[i] = formatter.format(c.getTime());
			// Subtract 1 month
			c.add(Calendar.MONTH, -1);
		}

		if (transactionMonth == null) {
			transactionMonth = months[0];
		}

		m.addAttribute("custCreditCard", custCreditCard);
		m.addAttribute("transactions",
				creditCardTransactionDao.getTransactionsByMonth(custCreditCard, transactionMonth));
		m.addAttribute("payments", creditCardPaymentDao.getPayments(custCreditCard));
		m.addAttribute("months", months);
		return "admin-cust-mgmt-credit-card-view";
	}

	@RequestMapping(value = "/activate/{id}")
	public String activateCustCreditCard(@PathVariable int id, Model m, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		custCreditCard.setStatus("active");
		custCreditCardDao.update(custCreditCard);
		ra.addFlashAttribute("msg", "You have successfully activated the credit card ending with "
				+ custCreditCard.getCardNum().split(" ")[3]);
		return "redirect:/admin/customer-management/credit-card";
	}

	@RequestMapping(value = "/deactivate/{id}")
	public String deactivateCustCreditCard(@PathVariable int id, Model m, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		custCreditCard.setStatus("inactive");
		custCreditCardDao.update(custCreditCard);
		ra.addFlashAttribute("msg", "You have successfully deactivate the credit card ending with "
				+ custCreditCard.getCardNum().split(" ")[3]);
		return "redirect:/admin/customer-management/credit-card";
	}

	@RequestMapping(value = "{id}/payment/add")
	public String showAddPayment(@PathVariable int id, Model m) {
		// Get last 6 months
		Format formatter = new SimpleDateFormat("yyyyMM");
		Calendar c = Calendar.getInstance();
		String[] months = new String[6];
		for (int i = 0; i < months.length; i++) {
			// Subtract 1 month
			c.add(Calendar.MONTH, -1);
			months[i] = formatter.format(c.getTime());
		}
		m.addAttribute("months", months);
		return "admin-cust-mgmt-credit-card-add-payment";
	}

	@RequestMapping(value = "{id}/payment/add/select-month", method = RequestMethod.POST)
	public String paymentSelectMonth(@PathVariable int id, @RequestParam String selectedMonth, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id);
		// Check if the payment statement already exists
		if (creditCardPaymentDao.getPaymentsByMonth(custCreditCard, selectedMonth).size() <= 0) {
			List<CreditCardTransaction> transactions = creditCardTransactionDao.getTransactionsByMonth(custCreditCard,
					selectedMonth);
			CreditCardPayment creditCardPayment = new CreditCardPayment();
			// Set total amount for the month
			creditCardPayment.setAmount(transactions.stream()
					.mapToDouble(transaction -> transaction.getType().equals("withdraw") ? transaction.getAmount() : 0)
					.sum());
			// Set interest charged for the month
			// Interest is based on annum basis, so it's divided by 12
			creditCardPayment.setInterestCharged(creditCardPayment.getAmount() * (custCreditCard.getCreditCard().getInterestRate() / 12));
			// Set description
			creditCardPayment.setDescription("Credit Card payment for " + selectedMonth);
			// Set default due date which is after 1 month
			creditCardPayment.setDueDate(LocalDate.now().plusMonths(1));
			creditCardPayment.setPaymentMonth(selectedMonth);
			creditCardPayment.setCreditCard(custCreditCard);

			ra.addFlashAttribute("creditCardPayment", creditCardPayment);
			ra.addFlashAttribute("selectedMonth", selectedMonth);
		} else {
			ra.addFlashAttribute("msg", "The statement for the payment already exists for the selected month.");
		}
		return "redirect:/admin/customer-management/credit-card/" + id + "/payment/add";
	}

	@RequestMapping(value = "/payment/save", method = RequestMethod.POST)
	public String paymentSave(@Valid @ModelAttribute("creditCardPayment") CreditCardPayment creditCardPayment,
			@RequestParam int cardId, BindingResult br, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(cardId);
		if (!br.hasErrors()) {
			creditCardPayment.setCreditCard(custCreditCard);
			creditCardPayment.setStatus("Pending");
			creditCardPaymentDao.save(creditCardPayment);
			String last4CardDigit = creditCardPayment.getCreditCard().getCardNum().split(" ")[3];
			String encryptedCardNum = String.join("", Collections.nCopies(3, "**** ")) + last4CardDigit;

			// Send Email
			double totalAmount = creditCardPayment.getAmount() + creditCardPayment.getInterestCharged() + creditCardPayment.getAdditionalCharge();
			DateTimeFormatter dueDateDf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String subject = "OBS New Credit Card Payment";
			String msg = "Dear " + custCreditCard.getCustomer().getName() + ",\n"
							+ "You have received a new payment statement for your " + custCreditCard.getCreditCard().getTitle() + " (Card No. " + encryptedCardNum + ").\n"
							+ "Below is the payment details:\n\n"
							+ "Payment Month: " + creditCardPayment.getPaymentMonth() + "\n"
							+ "Payment Description: " + (creditCardPayment.getDescription() == null || creditCardPayment.getDescription().isEmpty() ? "NIL" : creditCardPayment.getDescription()) + "\n"
							+ "Total Amount: " + totalAmount + " SGD\n"
							+ "Due Date: " + creditCardPayment.getDueDate().format(dueDateDf)
							+ "\n\nThank you for choosing OBS Bank. We wish you a great day!"
							+ "\n\nCheers,\nOBS Team";
			mailService.sendMail(custCreditCard.getCustomer().getEmail(), subject, msg);
			
			ra.addFlashAttribute("msg", "You have successfully add the payment statement to the credit card ending with " + last4CardDigit);
			return "redirect:/admin/customer-management/credit-card/view/" + custCreditCard.getId();
		} else {
			ra.addFlashAttribute("msg", "Failed to add the payment..");
			ra.addFlashAttribute("org.springframework.validation.BindingResult.creditCardPayment", br);
			ra.addFlashAttribute("creditCardPayment", creditCardPayment);
			return "redirect:/admin/customer-management/credit-card/" + custCreditCard.getId()
					+ "/payment/add";
		}
	}
	
	@RequestMapping(value = "payment/update/{id}")
	public String showUpdatePayment(@PathVariable int id, Model m) {
		CreditCardPayment creditCardPayment = creditCardPaymentDao.getPaymentById(id);
		// Remove pin for security purpose
		creditCardPayment.getCreditCard().setPin(null);
		m.addAttribute("creditCardPayment", creditCardPayment);
		return "admin-cust-mgmt-credit-card-update-payment";
	}

	@RequestMapping(value = "payment/update/save", method = RequestMethod.POST)
	public String updatePayment(@Valid @ModelAttribute("creditCardPayment") CreditCardPayment creditCardPayment,
			BindingResult br, @RequestParam int cardId, Model m, RedirectAttributes ra) {
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(cardId);
		if (!br.hasErrors()) {
			creditCardPayment.setCreditCard(custCreditCard);
			creditCardPayment.setStatus("Pending");
			creditCardPaymentDao.update(creditCardPayment);
			ra.addFlashAttribute("msg", "You have successfully updated the credit card payment with ID " + creditCardPayment.getId());
			return "redirect:/admin/customer-management/credit-card/view/" + creditCardPayment.getCreditCard().getId();
		} else {
			m.addAttribute("msg", "Failed to update the payment, please ensure all information are valid.");
			return "admin-cust-mgmt-credit-card-update-payment";
		}
	}
}
