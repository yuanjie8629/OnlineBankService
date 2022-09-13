package com.dao;

import java.util.List;

import com.bean.LoanPayment;
import com.bean.CustLoan;

public interface LoanPaymentDao {
	void save(LoanPayment payment);
	void update(LoanPayment payment);
	LoanPayment getPaymentById(int id);
	List<LoanPayment> getPayments(CustLoan custLoan);
	List<LoanPayment> getPaymentsByMonth(CustLoan custLoan, String month);
}
