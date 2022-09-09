package com.dao;

import java.util.List;

import com.bean.CustAccount;

public interface CustAccDao {
	void save(CustAccount custAccount);
	void update(CustAccount custAccount);
	CustAccount getCustAccountById(int id);
	List<CustAccount> getCustAccounts();
}