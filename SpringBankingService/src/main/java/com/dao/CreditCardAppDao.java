package com.dao;

import java.io.Serializable;
import java.util.List;

import com.bean.CreditCardApplication;

public interface CreditCardAppDao {
	Serializable save(CreditCardApplication application);
	void update(CreditCardApplication application);
	CreditCardApplication getCreditCardApplicationById(String id);
	CreditCardApplication trackCreditCardApplication(String id, String identityNumber);
	List<CreditCardApplication> getCreditCardApplications();
	List<CreditCardApplication> getCreditCardApplications(String status);
}
