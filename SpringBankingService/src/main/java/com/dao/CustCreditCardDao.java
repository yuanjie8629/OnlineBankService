package com.dao;

import java.util.List;

import com.bean.CustCreditCard;

public interface CustCreditCardDao {
	void save(CustCreditCard custCreditCard);
	void update(CustCreditCard custCreditCard);
	CustCreditCard getCustCreditCardById(int id);
	List<CustCreditCard> getCustCreditCards();
}
