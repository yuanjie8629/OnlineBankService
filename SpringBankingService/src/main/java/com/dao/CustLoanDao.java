package com.dao;

import java.util.List;

import com.bean.CustLoan;
import com.bean.Customer;

public interface CustLoanDao {
	void save(CustLoan custLoan);
	void update(CustLoan custLoan);
	CustLoan getCustLoanById(String id);
	CustLoan getCustLoanByCust(String id, Customer cust);
	List<CustLoan> getCustLoans();
	List<CustLoan> getCustLoans(String status);
	List<CustLoan> getCustLoansByCust(Customer cust);
}
