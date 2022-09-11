package com.dao;

import java.util.List;

import com.bean.AccountTransaction;
import com.bean.CustAccount;

public interface AccountTransactionDao {
	void save(AccountTransaction transaction);
	void update(AccountTransaction transaction);
	AccountTransaction getTransactionById(int id);
	List<AccountTransaction> getTransactionsByMonth(CustAccount custAcc, String month);
}
