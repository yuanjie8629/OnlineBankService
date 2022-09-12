package com.dao;

import java.util.List;
import com.bean.CustAccount;
import com.bean.Customer;

public interface CustAccDao {
	void save(CustAccount custAccount);
	void update(CustAccount custAccount);
	CustAccount getCustAccountById(String accNum);
	CustAccount getCustAccountByCust(String accNum, Customer cust);
	List<CustAccount> getCustAccounts();
	List<CustAccount> getCustAccounts(String status);
	List<CustAccount> getCustAccountsByCust(Customer cust);
}