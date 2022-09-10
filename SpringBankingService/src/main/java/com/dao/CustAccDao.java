package com.dao;

import java.util.List;

import com.bean.CustAccount;
import com.bean.Customer;

public interface CustAccDao {
	void save(CustAccount custAccount);
	void update(CustAccount custAccount);
	CustAccount getCustAccountById(int id);
	List<CustAccount> getCustAccounts();
	List<CustAccount> getCustAccountsByCust(Customer cust);
}