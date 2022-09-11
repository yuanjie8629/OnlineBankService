package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/payment")
public class CustPaymentController {

	@RequestMapping(value = "")
	public String payment() {
		return "cust-payment";
	}

	@RequestMapping(value = "/credit-card")
	public String creditCardPayment() {
		return "cust-payment-credit-card";
	}

	@RequestMapping(value = "/loan")
	public String loanPayment() {
		return "cust-payment-loan";
	}
}
