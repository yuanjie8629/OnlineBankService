package com.dao;

import java.util.List;

import com.bean.CustCreditCard;
import com.bean.Customer;

public interface CustCreditCardDao {
	void save(CustCreditCard custCreditCard);
	void update(CustCreditCard custCreditCard);
	CustCreditCard getCustCreditCardById(int id);
	CustCreditCard getCustCreditCardById(int id, Customer Cust);
	CustCreditCard getCustCreditCardByNum(String cardNum);
	CustCreditCard getCustCreditCardByCust(String cardNum, Customer cust);
	List<CustCreditCard> getCustCreditCards();
	List<CustCreditCard> getCustCreditCards(String status);
	List<CustCreditCard> getCustCreditCardsByCust(Customer cust);
}
