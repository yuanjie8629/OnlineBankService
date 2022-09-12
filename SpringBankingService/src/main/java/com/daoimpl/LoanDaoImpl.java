package com.daoimpl;

import java.util.List;


import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Loan;
import com.dao.LoanDao;

public class LoanDaoImpl implements LoanDao{
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void save(Loan loan) {
		template.persist(loan);
	}

	@Override
	@Transactional
	public void update(Loan loan) {
		template.update(loan);	
	}

	@Override
	@Transactional
	public void delete(int id) {
		Loan loan = getLoanById(id);
		loan.setDeleted(true);
		template.update(loan);
	}

	@Override
	@Transactional
	public void restore(int id) {
		Loan loan = getLoanById(id);
		loan.setDeleted(false);
		template.update(loan);
		
	}

	@Override
	public Loan getLoanById(int id) {
		return template.get(Loan.class, id);
	}

	@Override
	public List<Loan> getLoans() {
		return template.loadAll(Loan.class);
	}

	@Override
	public List<Loan> getLoans(String type) {
		return getLoans(type, false);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Loan> getLoans(String type, boolean showDeleted) {
		DetachedCriteria query = DetachedCriteria.forClass(Loan.class);
		if (type != null) {
			query.add(Property.forName("type").eq(type).ignoreCase());
		}

		if (!showDeleted) {
			query.add(Property.forName("isDeleted").eq(false));
		}
		return (List<Loan>) template.findByCriteria(query);
	}
}
