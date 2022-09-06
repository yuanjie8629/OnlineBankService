package com.dao;

import java.util.List;

import com.bean.AccountType;

public interface AccountTypeDao  {
	void save(AccountType account);
	void update(AccountType account);
	void delete(AccountType account);
	AccountType getAccountTypeById(int id);
	List<AccountType> getAccountTypes();
	List<AccountType> getAccountTypes(String type);
	List<AccountType> getAccountTypes(String type, String searchTitle);
	List<AccountType> getAccountTypes(String type, String sort, String searchTitle);
	List<AccountType> getAccountTypes(String type, String sort, String searchTitle, boolean showDeleted);
	List<AccountType> getAccountTypes(String type, String sort, String searchTitle, boolean showDeleted, int pageNum);
	List<AccountType> getAccountTypes(String type, String sort, String searchTitle, boolean showDeleted, int pageNum, int total);
	int getAccountTypeCount (String type, String sort, String searchTitle, boolean showDeleted);
}
