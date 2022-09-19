package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.AccountTransaction;
import com.bean.CreditCardTransaction;
import com.bean.CustAccount;
import com.bean.CustCreditCard;
import com.bean.Customer;
import com.dao.AccountTransactionDao;
import com.dao.CreditCardTransactionDao;
import com.dao.CustAccDao;
import com.dao.CustCreditCardDao;
import com.service.MailService;

@Controller
@RequestMapping("/customer/credit-card")
public class CustCreditCardController {
	@Autowired
	CustCreditCardDao custCreditCardDao;

	@Autowired
	AccountTransactionDao accTransactionDao;

	@Autowired
	CreditCardTransactionDao cardTransactionDao;

	@Autowired
	CustAccDao custAccDao;
	
	@Autowired
	MailService mailService;

	@Autowired
	HttpSession session;
	

	@RequestMapping(value = "")
	public String creditCard() {
		return "cust-credit-card";
	}

	@RequestMapping(value = "/view")
	public String viewCreditCards(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		List<CustCreditCard> custCreditCardList = custCreditCardDao.getCustCreditCardsByCust(cust);
		custCreditCardList.forEach(card -> {
			card.setCardNum(String.join("", Collections.nCopies(3, "**** ")) + card.getCardNum().split(" ")[3]);

			// Remove card pin from all card for safety purpose
			card.setPin("");
		});
		m.addAttribute("custCreditCardList", custCreditCardList);
		return "cust-credit-card-view";
	}

	@RequestMapping(value = "/summary/{id}")
	public String viewCreditCardSummary(@PathVariable int id, Model m, RedirectAttributes ra) {
		Customer cust = (Customer) session.getAttribute("user");
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id, cust);
		if (custCreditCard != null) {
			if (custCreditCard.getPin() != null && !custCreditCard.getPin().isEmpty())
				m.addAttribute("isPin", true);
			// Remove card pin from all card for safety purpose
			custCreditCard.setPin("");
			
			String encryptedCardNum = String.join("", Collections.nCopies(3, "**** ")) + custCreditCard.getCardNum().split(" ")[3];
			m.addAttribute("custCreditCard", custCreditCard);
			m.addAttribute("encryptedCardNum", encryptedCardNum);
			return "cust-credit-card-summary";
		}
		ra.addFlashAttribute("msg", "Failed to retrieve credit card information...");
		return "redirect:/customer/credit-card";

	}

	@RequestMapping(value = "/transaction/{id}")
	public String viewCreditCardTransaction(@PathVariable int id,
			@RequestParam(required = false) String transactionMonth, Model m, RedirectAttributes ra) {
		Customer cust = (Customer) session.getAttribute("user");
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id, cust);
		if (custCreditCard != null) {
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

			m.addAttribute("transactions", cardTransactionDao.getTransactionsByMonth(custCreditCard, transactionMonth));
			custCreditCard.setCardNum(
					String.join("", Collections.nCopies(3, "****")) + custCreditCard.getCardNum().split(" ")[3]);
			m.addAttribute("custCreditCard", custCreditCard);
			m.addAttribute("months", months);
			return "cust-credit-card-transaction";
		}
		ra.addFlashAttribute("msg", "Failed to retrieve credit card information...");
		return "redirect:/customer/credit-card";
	}

	@RequestMapping(value = "/summary/update-pin", method = RequestMethod.POST)
	public String updateCreditCardPin(@RequestParam int id, @RequestParam String cardNum, @RequestParam String password,
			@RequestParam String pin, RedirectAttributes ra) {
		if (pin.length() != 6) {
			ra.addFlashAttribute("changePinMsg", "Card Pin Number must be 6 digits.");
			return "redirect:/customer/credit-card/summary/" + id;
		}

		Customer cust = (Customer) session.getAttribute("user");
		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(id, cust);
		if (custCreditCard != null) {
			if (cardNum.equals(custCreditCard.getCardNum()) && password.equals(cust.getPassword())) {
				custCreditCard.setPin(pin);
				custCreditCardDao.update(custCreditCard);
				ra.addFlashAttribute("msg", "You have successfully updated your credit card pin.");
				return "redirect:/customer/credit-card/summary/" + id;
			} else {
				ra.addFlashAttribute("changePinMsg", "Failed to update credit card pin. Invalid details.");
				return "redirect:/customer/credit-card/summary/" + id;
			}
		}
		ra.addFlashAttribute("msg", "You have no permission to update the credit card pin.");
		return "redirect:/customer/credit-card";
	}

	@RequestMapping(value = "/transfer")
	public String showTransferToAccount(Model m) {
		Customer cust = (Customer) session.getAttribute("user");
		List<CustCreditCard> custCreditCardList = custCreditCardDao.getCustCreditCardsByCust(cust);

		// Remove card pin from all card for safety purpose
		custCreditCardList.forEach(card -> {
			card.setPin("");
		});
		custCreditCardList.forEach(card -> {
			card.setCardNum(String.join("", Collections.nCopies(3, "****")) + card.getCardNum().split(" ")[3]);
		});
		m.addAttribute("custCreditCardList", custCreditCardList);
		m.addAttribute("custAccList", custAccDao.getCustAccountsByCust(cust));
		return "cust-credit-card-transfer";
	}

	@RequestMapping(value = "/transfer/save", method = RequestMethod.POST)
	@Transactional
	public String transferToAccount(@RequestParam int creditCardFrom, @RequestParam String accTo,
			@RequestParam double amount, @RequestParam(required = false) String description, @RequestParam String pin,
			Model m, RedirectAttributes ra) {

		CustCreditCard custCreditCard = custCreditCardDao.getCustCreditCardById(creditCardFrom);

		if (custCreditCard.getPin() == null) {
			ra.addFlashAttribute("msg", "Please set up your credit card pin before transferring to account.");
		} else if (!pin.equals(custCreditCard.getPin())) {
			ra.addFlashAttribute("msg", "Invalid card pin number.");
		} else if (custCreditCard.getStatus().toLowerCase().equals("inactive")) {
			// Inactive credit card validation
			ra.addFlashAttribute("msg", "Failed to transfer the money. Your credit card is inactive.");
		} else {
			// Validate if credit card has sufficient balance to transfer
			if (amount <= custCreditCard.getBalance()) {
				// Update amount spent for the creditCard
				custCreditCard.setBalance(custCreditCard.getBalance() - amount);
				custCreditCardDao.update(custCreditCard);

				// Encrypt the card and account numbers
				String encryptedCardNum = String.join("", Collections.nCopies(3, "**** "))
						+ custCreditCard.getCardNum().split(" ")[3];
				String encryptedAccTo = accTo.substring(0, 6)
						+ String.join("", Collections.nCopies(accTo.length() - 6, "*"));

				// Add transaction for the credit Card
				CreditCardTransaction creditCardTransaction = new CreditCardTransaction();
				creditCardTransaction.setType("withdraw");
				creditCardTransaction.setAmount(amount);
				creditCardTransaction.setDescription(description);
				creditCardTransaction.setReference("Credit Card Transfer to " + encryptedAccTo);
				creditCardTransaction.setBalance(custCreditCard.getBalance());
				creditCardTransaction.setStatus("posted");
				creditCardTransaction.setCreditCard(custCreditCard);
				cardTransactionDao.save(creditCardTransaction);

				// Update balance for accTo
				CustAccount custAccTo = custAccDao.getCustAccountById(accTo);
				custAccTo.setAvailBal(custAccTo.getAvailBal() + amount);
				custAccTo.setCurBal(custAccTo.getCurBal() + amount);
				custAccDao.update(custAccTo);

				// Add transaction for accTo
				AccountTransaction accToTransaction = new AccountTransaction();
				accToTransaction.setType("deposit");
				accToTransaction.setAccount(custAccTo);
				accToTransaction.setAmount(amount);
				accToTransaction.setDescription(description);
				accToTransaction.setReference("Credit Card Transfer from " + encryptedCardNum);
				accToTransaction.setBalance(custAccTo.getAvailBal());
				accToTransaction.setStatus("posted");
				accTransactionDao.save(accToTransaction);
				
				// Send Email
				DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String subject = "OBS Fund Transfer";
				String msg = "Dear " + custAccTo.getCustomer().getName() + ",\n"
								+ "You have successfully transferred your funds from your credit card (Card No. " + encryptedCardNum + ") to account (No. " + encryptedAccTo + ").\n"
								+ "Below is the transaction details:\n\n"
								+ "Transaction Date: " + creditCardTransaction.getDate().format(df) + "\n"
								+ "Transaction Reference: " + creditCardTransaction.getReference() + "\n"
								+ "Transaction Description: " + (creditCardTransaction.getDescription() == null || creditCardTransaction.getDescription().isEmpty() ? "NIL" : creditCardTransaction.getDescription()) + "\n"
								+ "Amount: " + creditCardTransaction.getAmount() + " SGD"
								+ "\n\nThank you for choosing OBS Bank. We wish you a great day!"
								+ "\n\nCheers,\nOBS Team";
				mailService.sendMail(custCreditCard.getCustomer().getEmail(), subject, msg);
				
				ra.addFlashAttribute("success", true);
				ra.addFlashAttribute("transaction", creditCardTransaction);
				ra.addFlashAttribute("creditCardFrom", encryptedCardNum);
				ra.addFlashAttribute("accTo", encryptedAccTo);
			} else {
				ra.addFlashAttribute("msg", "Your credit card balance is not sufficient for this transaction.");
			}
		}
		return "redirect:/customer/credit-card/transfer";
	}
}
