package com.daoimpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.CustCreditCard;
import com.bean.Customer;
import com.dao.CustCreditCardDao;

public class CustCreditCardDaoImpl implements CustCreditCardDao{
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void save(CustCreditCard custCreditCard) {
		template.persist(custCreditCard);
	}

	@Override
	@Transactional
	public void update(CustCreditCard custCreditCard) {
		template.update(custCreditCard);
	}
	
	@Override
	public CustCreditCard getCustCreditCardById(int id) {
		return template.get(CustCreditCard.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CustCreditCard getCustCreditCardById(int id, Customer Cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustCreditCard.class);
		query.add(Restrictions.eq("id", id));
		query.add(Restrictions.eq("customer", Cust));
		List<CustCreditCard> custCreditCardList = (List<CustCreditCard>) template.findByCriteria(query);
		if (!custCreditCardList.isEmpty()) {
			return custCreditCardList.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public CustCreditCard getCustCreditCardByNum(String cardNum) {
		DetachedCriteria query = DetachedCriteria.forClass(CustCreditCard.class);
		query.add(Restrictions.eq("cardNum", cardNum));
		List<CustCreditCard> custCreditCardList = (List<CustCreditCard>) template.findByCriteria(query);
		if (!custCreditCardList.isEmpty()) {
			return custCreditCardList.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CustCreditCard getCustCreditCardByCust(String cardNum, Customer cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustCreditCard.class);
		query.add(Restrictions.eq("customer", cust));
		query.add(Restrictions.eq("cardNum", cardNum));
		List<CustCreditCard> custCreditCardList = (List<CustCreditCard>) template.findByCriteria(query);
		if (!custCreditCardList.isEmpty()) {
			return custCreditCardList.get(0);
		}
		return null;
	}

	@Override
	public List<CustCreditCard> getCustCreditCards() {
		return template.loadAll(CustCreditCard.class);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CustCreditCard> getCustCreditCards(String status) {
		DetachedCriteria query = DetachedCriteria.forClass(CustCreditCard.class);
		query.add(Restrictions.eq("status", status));
		return (List<CustCreditCard>) template.findByCriteria(query);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustCreditCard> getCustCreditCardsByCust(Customer cust) {
		DetachedCriteria query = DetachedCriteria.forClass(CustCreditCard.class);
		query.add(Restrictions.eq("customer", cust));
		return (List<CustCreditCard>) template.findByCriteria(query);
	}
}
