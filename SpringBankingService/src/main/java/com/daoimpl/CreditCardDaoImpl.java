package com.daoimpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.bean.CreditCard;
import com.dao.CreditCardDao;

public class CreditCardDaoImpl implements CreditCardDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(CreditCard card) {
		template.persist(card);
	}

	@Override
	@Transactional
	public void update(CreditCard card) {
		template.update(card);
	}

	@Override
	@Transactional
	public void delete(int id) {
		CreditCard card = getCreditCardById(id);
		card.setDeleted(true);
		template.update(card);
	}

	@Override
	@Transactional
	public void restore(int id) {
		CreditCard card = getCreditCardById(id);
		card.setDeleted(false);
		template.update(card);
	}

	@Override
	public CreditCard getCreditCardById(int id) {
		return template.get(CreditCard.class, id);
	}

	@Override
	public List<CreditCard> getCreditCards() {
		return template.loadAll(CreditCard.class);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<CreditCard> getCreditCards(boolean showDeleted) {
		DetachedCriteria query = DetachedCriteria.forClass(CreditCard.class);
		
		if (!showDeleted) {
			query.add(Property.forName("isDeleted").eq(false));
		}
		
		return (List<CreditCard>) template.findByCriteria(query);
	}
}
