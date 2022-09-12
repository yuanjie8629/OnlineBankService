package com.daoimpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
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
		template.persist(custAccount);
	}

	@Override
	@Transactional
	public void update(CustAccount custAccount) {
		template.update(custAccount);
	}
	
	public CustAccount getCustAccountById(String accNum) {
		return template.get(CustAccount.class, accNum);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CustAccount getCustAccountByCust(String accNum, Customer cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustAccount.class);
		query.add(Restrictions.eq("customer", cust));
		query.add(Restrictions.eq("accNum", accNum));
		List<CustAccount> custAccList = (List<CustAccount>) template.findByCriteria(query);
		if (!custAccList.isEmpty()) {
			return custAccList.get(0);
		}
		return null;
	}

	@Override
	public List<CustAccount> getCustAccounts() {
		return template.loadAll(CustAccount.class);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CustAccount> getCustAccounts(String status) {
		DetachedCriteria query = DetachedCriteria.forClass(CustAccount.class);
		query.add(Restrictions.eq("status", status));
		return (List<CustAccount>) template.findByCriteria(query);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustAccount> getCustAccountsByCust(Customer cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustAccount.class);
		query.add(Restrictions.eq("customer", cust));
		return (List<CustAccount>) template.findByCriteria(query);
	}
}
