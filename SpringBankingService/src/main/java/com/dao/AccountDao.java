package com.dao;

import java.util.List;

import com.bean.Account;

public interface AccountDao  {
	void save(Account account);
	void update(Account account);
	void delete(int id);
	void restore(int id);
	Account getAccountById(int id);
	List<Account> getAccounts();
	List<Account> getAccounts(String type);
	List<Account> getAccounts(String type, boolean showDeleted);
}
