package com.daoimpl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.CustCreditCard;
import com.dao.CustCreditCardDao;

public class CustCreditCardDaoImpl implements CustCreditCardDao{
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void save(CustCreditCard custCreditCard) {
		template.save(custCreditCard);
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

	@Override
	public List<CustCreditCard> getCustCreditCards() {
		return template.loadAll(CustCreditCard.class);
	}

}
