package com.daoimpl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.CreditCardPayment;
import com.bean.CreditCardPayment;
import com.bean.CustCreditCard;
import com.dao.CreditCardPaymentDao;

public class CreditCardPaymentDaoImpl implements CreditCardPaymentDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(CreditCardPayment payment) {
		template.persist(payment);
	}

	@Override
	@Transactional
	public void update(CreditCardPayment payment) {
		template.update(payment);
	}

	@Override
	public CreditCardPayment getPaymentById(int id) {
		return template.get(CreditCardPayment.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CreditCardPayment> getPayments(CustCreditCard custCreditCard) {
		DetachedCriteria query = DetachedCriteria.forClass(CreditCardPayment.class);
		query.add(Restrictions.eq("creditCard", custCreditCard));
		return (List<CreditCardPayment>) template.findByCriteria(query);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CreditCardPayment> getPaymentsByMonth(CustCreditCard custCreditCard, String month) {
		DetachedCriteria query = DetachedCriteria.forClass(CreditCardPayment.class);
		query.add(Restrictions.eq("creditCard", custCreditCard));
		query.add(Restrictions.eq("paymentMonth", month));
		return (List<CreditCardPayment>) template.findByCriteria(query);
	}
}
