package com.dao;

import java.util.List;

import com.bean.CreditCardTransaction;
import com.bean.CustCreditCard;

public interface CreditCardTransactionDao {
	void save(CreditCardTransaction transaction);
	void update(CreditCardTransaction transaction);
	CreditCardTransaction getTransactionById(int id);
	List<CreditCardTransaction> getTransactionsByMonth(CustCreditCard custCreditCard, String month);
}