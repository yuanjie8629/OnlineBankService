package com.dao;

import java.time.LocalDate;
import java.util.List;

import com.bean.AccountTransaction;
import com.bean.CustAccount;

public interface AccountTransactionDao {
	void save(AccountTransaction transaction);
	void update(AccountTransaction transaction);
	AccountTransaction getTransactionById(int id);
	double getTotalTransferAmountByDate(CustAccount custAcc, LocalDate date);
	List<AccountTransaction> getTransactionsByMonth(CustAccount custAcc, String month);
}
