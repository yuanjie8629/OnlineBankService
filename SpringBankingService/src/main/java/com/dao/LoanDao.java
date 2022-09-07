package com.dao;

import java.util.List;

import com.bean.Loan;

public interface LoanDao {
	void save(Loan loan);
	void update(Loan loan);
	void delete(int id);
	void restore(int id);
	Loan getLoanById(int id);
	List<Loan> getLoans();
	List<Loan> getLoans(String type);
	List<Loan> getLoans(String type, boolean showDeleted);
}
