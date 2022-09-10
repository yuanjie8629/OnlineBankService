package com.daoimpl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.CustAccount;
import com.bean.Customer;
import com.dao.CustAccDao;

public class CustAccDaoImpl implements CustAccDao{
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void save(CustAccount custAccount) {
		template.save(custAccount);
	}

	@Override
	@Transactional
	public void update(CustAccount custAccount) {
		template.update(custAccount);
	}

	@Override
	public CustAccount getCustAccountById(int id) {
		return template.get(CustAccount.class, id);
	}

	@Override
	public List<CustAccount> getCustAccounts() {
		return template.loadAll(CustAccount.class);
	}

	@Override
	public List<CustAccount> getCustAccountsByCust(Customer cust) {
		return cust.getAccounts();
	}
}
