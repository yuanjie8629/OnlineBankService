package com.dao;

import java.io.Serializable;
import java.util.List;

import com.bean.LoanApplication;

public interface LoanAppDao {
	Serializable save(LoanApplication application);
	void update(LoanApplication application);
	LoanApplication getLoanApplicationById(String id);
	LoanApplication trackLoanApplication(String id, String identityNumber);
	List<LoanApplication> getLoanApplications();
	List<LoanApplication> getLoanApplications(String status);
}
