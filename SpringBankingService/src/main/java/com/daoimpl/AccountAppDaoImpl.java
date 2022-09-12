package com.daoimpl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;


import com.bean.AccountApplication;
import com.dao.AccountAppDao;

public class AccountAppDaoImpl implements AccountAppDao{
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public Serializable save(AccountApplication application) {
		return template.save(application);
	}

	@Override
	@Transactional
	public void update(AccountApplication application) {
		template.update(application);
	}

	@Override
	public AccountApplication getAccountApplicationById(String id) {
		return template.get(AccountApplication.class, id); 
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public AccountApplication trackAccountApplication(String id, String identityNumber) {
		DetachedCriteria query = DetachedCriteria.forClass(AccountApplication.class);
		query.add(Restrictions.eq("id", id));
		query.add(Restrictions.eq("identityNumber", identityNumber));
		List<AccountApplication> list = (List<AccountApplication>) template.findByCriteria(query,0,1);
		if (!list.isEmpty())
			return list.get(0);
		return null;
	}

	@Override
	public List<AccountApplication> getAccountApplications() {
		return template.loadAll(AccountApplication.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AccountApplication> getAccountApplications(String status) {
		DetachedCriteria query = DetachedCriteria.forClass(AccountApplication.class);
		query.add(Property.forName("status").eq(status).ignoreCase());
		return (List<AccountApplication>) template.findByCriteria(query);
	}
}
