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

import com.bean.CreditCardTransaction;
import com.bean.CustCreditCard;
import com.dao.CreditCardTransactionDao;

public class CreditCardTransactionDaoImpl implements CreditCardTransactionDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(CreditCardTransaction transaction) {
		template.persist(transaction);
	}

	@Override
	@Transactional
	public void update(CreditCardTransaction transaction) {
		template.update(transaction);
	}

	@Override
	public CreditCardTransaction getTransactionById(int id) {
		return template.get(CreditCardTransaction.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CreditCardTransaction> getTransactionsByMonth(CustCreditCard custCreditCard, String month) {
		// Add day to the string to avoid DateTimeParseException due to no day
		month += "01";
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDateTime thisMonth = LocalDate.parse(month, df).atStartOfDay();

		DetachedCriteria query = DetachedCriteria.forClass(CreditCardTransaction.class);
		query.add(Restrictions.eq("creditCard", custCreditCard));
		query.add(Restrictions.between("date", thisMonth, thisMonth.with(TemporalAdjusters.lastDayOfMonth())));
		return (List<CreditCardTransaction>) template.findByCriteria(query);
	}
}
