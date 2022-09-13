package com.daoimpl;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Feedback;
import com.dao.FeedbackDao;

public class FeedbackDaoImpl implements FeedbackDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Override
	@Transactional
	public void save(Feedback feedback) {
		template.persist(feedback);
	}
}
