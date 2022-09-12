package com.daoimpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.CustLoan;
import com.bean.Customer;
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
	public CustLoan getCustLoanById(String id) {
		return template.get(CustLoan.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CustLoan getCustLoanByCust(String id, Customer cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustLoan.class);
		query.add(Restrictions.eq("customer", cust));
		query.add(Restrictions.eq("id", id));
		List<CustLoan> custLoanList = (List<CustLoan>) template.findByCriteria(query);
		if (!custLoanList.isEmpty()) {
			return custLoanList.get(0);
		}
		return null;
	}

	@Override
	public List<CustLoan> getCustLoans() {
		return template.loadAll(CustLoan.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustLoan> getCustLoansByCust(Customer cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustLoan.class);
		query.add(Restrictions.eq("customer", cust));
		return (List<CustLoan>) template.findByCriteria(query);
	}

}
