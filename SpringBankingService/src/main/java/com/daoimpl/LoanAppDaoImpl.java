package com.daoimpl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.LoanApplication;
import com.dao.LoanAppDao;

public class LoanAppDaoImpl implements LoanAppDao{
	
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public Serializable save(LoanApplication application) {
		return template.save(application);
	}

	@Override
	@Transactional
	public void update(LoanApplication application) {
		template.update(application);
	}

	@Override
	public LoanApplication getLoanApplicationById(String id) {
		return template.get(LoanApplication.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public LoanApplication trackLoanApplication(String id, String identityNumber) {
		DetachedCriteria query = DetachedCriteria.forClass(LoanApplication.class);
		query.add(Restrictions.eq("id", id));
		query.add(Restrictions.eq("identityNumber", identityNumber));
		List<LoanApplication> list = (List<LoanApplication>) template.findByCriteria(query,0,1);
		if (!list.isEmpty())
			return list.get(0);
		return null;
	}

	@Override
	public List<LoanApplication> getLoanApplications() {
		return template.loadAll(LoanApplication.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoanApplication> getLoanApplications(String status) {
		DetachedCriteria query = DetachedCriteria.forClass(LoanApplication.class);
		query.add(Property.forName("status").eq(status).ignoreCase());
		return (List<LoanApplication>) template.findByCriteria(query);
	}
}
