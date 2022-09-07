package com.dao;

import java.util.List;

import com.bean.CreditCard;

public interface CreditCardDao {
	void save(CreditCard card);
	void update(CreditCard card);
	void delete(int id);
	void restore(int id);
	CreditCard getCreditCardById(int id);
	List<CreditCard> getCreditCards();
	List<CreditCard> getCreditCards(boolean showDeleted);
}