package com.dao;

import java.util.List;

import com.bean.CreditCardPayment;
import com.bean.CustCreditCard;

public interface CreditCardPaymentDao {
	void save(CreditCardPayment payment);
	void update(CreditCardPayment payment);
	CreditCardPayment getPaymentById(int id);
	List<CreditCardPayment> getPaymentsByMonth(CustCreditCard custCreditCard, String month);
}
