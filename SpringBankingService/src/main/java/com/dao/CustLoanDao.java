package com.dao;

import java.util.List;

import com.bean.CustLoan;

public interface CustLoanDao {
	void save(CustLoan custLoan);
	void update(CustLoan custLoan);
	CustLoan getCustLoanById(int id);
	List<CustLoan> getCustLoans();
}
