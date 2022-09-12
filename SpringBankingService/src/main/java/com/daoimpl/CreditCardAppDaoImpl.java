package com.daoimpl;

import java.io.Serializable;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.bean.CreditCardApplication;

import com.dao.CreditCardAppDao;

public class CreditCardAppDaoImpl implements CreditCardAppDao{
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public Serializable save(CreditCardApplication application) {
		return template.save(application);
	}

	@Override
	@Transactional
	public void update(CreditCardApplication application) {
		template.update(application);
	}

	@Override
	public CreditCardApplication getCreditCardApplicationById(String id) {
		return template.get(CreditCardApplication.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CreditCardApplication trackCreditCardApplication(String id, String identityNumber) {
		DetachedCriteria query = DetachedCriteria.forClass(CreditCardApplication.class);
		query.add(Restrictions.eq("id", id));
		query.add(Restrictions.eq("identityNumber", identityNumber));
		List<CreditCardApplication> list = (List<CreditCardApplication>) template.findByCriteria(query,0,1);
		if (!list.isEmpty())
			return list.get(0);
		return null;
	}

	@Override
	public List<CreditCardApplication> getCreditCardApplications() {
		return template.loadAll(CreditCardApplication.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CreditCardApplication> getCreditCardApplications(String status) {
		DetachedCriteria query = DetachedCriteria.forClass(CreditCardApplication.class);
		query.add(Property.forName("status").eq(status).ignoreCase());
		return (List<CreditCardApplication>) template.findByCriteria(query);
	}
}
