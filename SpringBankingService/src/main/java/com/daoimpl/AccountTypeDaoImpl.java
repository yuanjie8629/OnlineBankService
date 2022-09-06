package com.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.bean.AccountType;
import com.dao.AccountTypeDao;

public class AccountTypeDaoImpl implements AccountTypeDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(AccountType account) {
		template.persist(account);
	}

	@Override
	@Transactional
	public void update(AccountType account) {
		template.update(account);
	}

	@Override
	@Transactional
	public void delete(AccountType account) {
		account.setDeleted(true);
		template.update(account);
	}

	@Override
	public AccountType getAccountTypeById(int id) {
		return template.get(AccountType.class, id);
	}

	@Override
	public List<AccountType> getAccountTypes() {
		return template.loadAll(AccountType.class);
	}

	@Override
	public List<AccountType> getAccountTypes(String type) {
		return getAccountTypes(type, null);
	}

	@Override
	public List<AccountType> getAccountTypes(String type, String searchTitle) {
		return getAccountTypes(type, null, searchTitle);
	}

	@Override
	public List<AccountType> getAccountTypes(String type, String sort, String searchTitle) {
		return getAccountTypes(type, sort, searchTitle, false);
	}

	@Override
	public List<AccountType> getAccountTypes(String type, String sort, String searchTitle, boolean showDeleted) {
		return getAccountTypes(type, sort, searchTitle, showDeleted, 1);
	}

	@Override
	public List<AccountType> getAccountTypes(String type, String sort, String searchTitle, boolean showDeleted,
			int pageNum) {
		return getAccountTypes(type, sort, searchTitle, showDeleted, pageNum, 5);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AccountType> getAccountTypes(String type, String sort, String searchTitle, boolean showDeleted,
			int pageNum, int total) {
		DetachedCriteria query = DetachedCriteria.forClass(AccountType.class);
		if (type != null) {
			query.add(Property.forName("type").eq(type));
		}
		
		if (searchTitle != null) {
			query.add(Property.forName("title").like("%" + searchTitle + "%").ignoreCase());
		}
		
		if (showDeleted) {
			query.add(Property.forName("isDeleted").eq(true));
		}
		
		if (sort != null) {
			if (sort.startsWith("-")) {
				query.addOrder(Order.desc(sort.substring(1)));
			} else {
				query.addOrder(Order.asc(sort));
			}
		}
		
		return (List<AccountType>) template.findByCriteria(query, (pageNum - 1) * total, total);
	}

	@Override
	public int getAccountTypeCount(String type, String sort, String searchTitle, boolean showDeleted) {
		DetachedCriteria query = DetachedCriteria.forClass(AccountType.class);
		if (type != null) {
			query.add(Property.forName("type").eq(type));
		}
		
		if (searchTitle != null) {
			query.add(Property.forName("title").like("%" + searchTitle + "%").ignoreCase());
		}
		
		if (showDeleted) {
			query.add(Property.forName("isDeleted").eq(true));
		}
		
		if (sort != null) {
			if (sort.startsWith("-")) {
				query.addOrder(Order.desc(sort.substring(1)));
			} else {
				query.addOrder(Order.asc(sort));
			}
		}
		
		query.setProjection(Projections.rowCount());
		return ((Long)template.findByCriteria(query).get(0)).intValue();
	}
}
