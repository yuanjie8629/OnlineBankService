package com.daoimpl;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

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
		System.out.println(admin);
		template.update(admin);
	}

	@Override
	public Admin getAdminById(int id) {
		return template.get(Admin.class, id);
	}
}
