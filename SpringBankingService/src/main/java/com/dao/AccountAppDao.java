package com.dao;

import java.io.Serializable;
import java.util.List;

import com.bean.AccountApplication;

public interface AccountAppDao {
	Serializable save(AccountApplication application);
	void update(AccountApplication application);
	AccountApplication getAccountApplicationById(String id);
	AccountApplication trackAccountApplication(String id, String identityNumber);
	List<AccountApplication> getAccountApplications();
	List<AccountApplication> getAccountApplications(String status);
}