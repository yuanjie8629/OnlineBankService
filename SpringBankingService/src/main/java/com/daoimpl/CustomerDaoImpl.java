package com.daoimpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Customer;
import com.dao.CustomerDao;

public class CustomerDaoImpl implements CustomerDao {
	
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void save(Customer customer) {
		template.persist(customer);
	}

	@Override
	@Transactional
	public void update(Customer customer) {
		template.update(customer);	
	}
	
	@Override
	@Transactional
	public void deactivate(int id) {
		Customer cust = getCustomerById(id);
		cust.setStatus("inactive");
		template.update(cust);
	}

	@Override
	@Transactional
	public void activate(int id) {
		Customer cust = getCustomerById(id);
		cust.setStatus("active");
		template.update(cust);
	}

	@Override
	public Customer getCustomerById(int id) {
		return template.get(Customer.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Customer getCustomerByIdentityNum(String identityNumber) {
		DetachedCriteria query = DetachedCriteria.forClass(Customer.class);
		query.add(Property.forName("identityNumber").eq(identityNumber).ignoreCase());
		List<Customer> custList = (List<Customer>) template.findByCriteria(query,0, 1);
		if (!custList.isEmpty()) {
			return custList.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Customer getCustomerByCredentials(String username, String password) {
		DetachedCriteria query = DetachedCriteria.forClass(Customer.class);
		query.add(Property.forName("username").eq(username));
		query.add(Property.forName("password").eq(password));
		List<Customer> custList = (List<Customer>) template.findByCriteria(query,0, 1);
		if (!custList.isEmpty()) {
			return custList.get(0);
		}
		return null;
	}

	@Override
	public List<Customer> getCustomers() {
		return template.loadAll(Customer.class);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> getCustomers(String status) {
		DetachedCriteria query = DetachedCriteria.forClass(Customer.class);
		query.add(Restrictions.eq("status", status));
		return (List<Customer>) template.findByCriteria(query);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Customer getCustomerForRegister(String identityNumber, String name, String email) {
		DetachedCriteria query = DetachedCriteria.forClass(Customer.class);
		query.add(Restrictions.eq("identityNumber", identityNumber));
		query.add(Restrictions.eq("name", name));
		query.add(Restrictions.eq("email", email));
		List<Customer> custList = (List<Customer>) template.findByCriteria(query);
		if (!custList.isEmpty()) {
			return custList.get(0);
		}
		return null;
	}
}
