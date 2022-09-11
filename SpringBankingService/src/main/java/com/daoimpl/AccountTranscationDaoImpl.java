package com.daoimpl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.bean.AccountTransaction;
import com.bean.CustAccount;
import com.dao.AccountTransactionDao;

public class AccountTranscationDaoImpl implements AccountTransactionDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	public void save(AccountTransaction transaction) {
		template.save(transaction);
	}

	@Override
	public void update(AccountTransaction transaction) {
		template.update(transaction);
	}

	@Override
	public AccountTransaction getTransactionById(int id) {
		return template.get(AccountTransaction.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AccountTransaction> getTransactionsByMonth(CustAccount custAcc, String month) {
		// Add day to the string to avoid DateTimeParseException due to no day
		month += "01";
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDateTime thisMonth = LocalDate.parse(month, df).atStartOfDay();

		DetachedCriteria query = DetachedCriteria.forClass(AccountTransaction.class);
		query.add(Restrictions.eq("account", custAcc));
		query.add(Restrictions.between("date", thisMonth, thisMonth.with(TemporalAdjusters.lastDayOfMonth())));
		return (List<AccountTransaction>) template.findByCriteria(query);
	}
}
