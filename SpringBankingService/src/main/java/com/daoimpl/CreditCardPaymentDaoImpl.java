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
	public List<CreditCardPayment> getPaymentsByMonth(CustCreditCard custCreditCard, String month) {
		// Add day to the string to avoid DateTimeParseException due to no day
		month += "01";
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDateTime thisMonth = LocalDate.parse(month, df).atStartOfDay();

		DetachedCriteria query = DetachedCriteria.forClass(CreditCardPayment.class);
		query.add(Restrictions.eq("creditCard", custCreditCard));
		query.add(Restrictions.between("date", thisMonth, thisMonth.with(TemporalAdjusters.lastDayOfMonth())));
		return (List<CreditCardPayment>) template.findByCriteria(query);
	}

}
