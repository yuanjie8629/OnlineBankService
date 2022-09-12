package com.daoimpl;


import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Admin;
import com.dao.AdminDao;

public class AdminDaoImpl implements AdminDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void update(Admin admin) {
		template.update(admin);
	}

	@Override
	public Admin getAdminById(int id) {
		return template.get(Admin.class, id);
	}
}
