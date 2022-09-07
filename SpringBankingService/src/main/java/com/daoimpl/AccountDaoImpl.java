package com.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.bean.Account;
import com.dao.AccountDao;

public class AccountDaoImpl implements AccountDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(Account account) {
		template.persist(account);
	}

	@Override
	@Transactional
	public void update(Account account) {
		template.update(account);
	}

	@Override
	@Transactional
	public void delete(int id) {
		Account account = getAccountById(id);
		account.setDeleted(true);
		template.update(account);
	}
	
	@Override
	@Transactional
	public void restore(int id) {
		Account account = getAccountById(id);
		account.setDeleted(false);
		template.update(account);
	}

	@Override
	public Account getAccountById(int id) {
		return template.get(Account.class, id);
	}

	@Override
	public List<Account> getAccounts() {
		return template.loadAll(Account.class);
	}

	@Override
	public List<Account> getAccounts(String type) {
		return getAccounts(type, false);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Account> getAccounts(String type, boolean showDeleted) {
		DetachedCriteria query = DetachedCriteria.forClass(Account.class);
		if (type != null) {
			query.add(Property.forName("type").eq(type));
		}
		
		if (!showDeleted) {
			query.add(Property.forName("isDeleted").eq(false));
		}
		
		return (List<Account>) template.findByCriteria(query);
	}
}
