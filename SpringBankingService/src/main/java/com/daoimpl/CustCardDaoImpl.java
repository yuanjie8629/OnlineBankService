package com.daoimpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CustCard;
import com.dao.CustCardDao;

@Repository
public class CustCardDaoImpl implements CustCardDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkCardByCardNum(String cardNum) {
		DetachedCriteria query = DetachedCriteria.forClass(CustCard.class);
		query.add(Restrictions.eq("cardNum", cardNum));
		List<CustCard> list = (List<CustCard>) template.findByCriteria(query, 0, 1);
		if (list.isEmpty())
			return true;
		return false;
	}
}
