package com.daoimpl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.CustLoan;
import com.dao.CustLoanDao;

public class CustLoanDaoImpl implements CustLoanDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void save(CustLoan custLoan) {
		template.save(custLoan);
	}

	@Override
	@Transactional
	public void update(CustLoan custLoan) {
		template.update(custLoan);
	}

	@Override
	public CustLoan getCustLoanById(int id) {
		return template.get(CustLoan.class, id);
	}

	@Override
	public List<CustLoan> getCustLoans() {
		return template.loadAll(CustLoan.class);
	}

}
