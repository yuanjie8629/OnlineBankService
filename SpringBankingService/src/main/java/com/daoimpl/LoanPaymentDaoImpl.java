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

import com.bean.LoanPayment;
import com.bean.CustLoan;
import com.dao.LoanPaymentDao;

public class LoanPaymentDaoImpl implements LoanPaymentDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(LoanPayment payment) {
		template.persist(payment);
	}

	@Override
	@Transactional
	public void update(LoanPayment payment) {
		template.update(payment);
	}

	@Override
	public LoanPayment getPaymentById(int id) {
		return template.get(LoanPayment.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoanPayment> getPaymentsByMonth(CustLoan custLoan, String month) {
		// Add day to the string to avoid DateTimeParseException due to no day
		month += "01";
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDateTime thisMonth = LocalDate.parse(month, df).atStartOfDay();

		DetachedCriteria query = DetachedCriteria.forClass(LoanPayment.class);
		query.add(Restrictions.eq("loan", custLoan));
		query.add(Restrictions.between("date", thisMonth, thisMonth.with(TemporalAdjusters.lastDayOfMonth())));
		return (List<LoanPayment>) template.findByCriteria(query);
	}
}
