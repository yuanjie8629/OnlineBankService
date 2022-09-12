package com.daoimpl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bean.User;
import com.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao{
	private HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Override
	@Transactional
	public void update(User user) {
		template.update(user);
	}
	
	@Override
 	public User login(final String username, final String password) {
		User user = template.execute(new HibernateCallback<User>() {
			@Override
			public User doInHibernate(Session session) throws HibernateException {
				TypedQuery<User> query = session.createQuery("from User where username=:username and password=:password", User.class);
				query.setParameter("username", username);
				query.setParameter("password", password);
				query.setMaxResults(1);
				List<User> userList = query.getResultList();
				if (userList.isEmpty())
					return null;
				return query.getResultList().get(0);
			}
		});
		return user;
		
//		User user = new User(username, password);
//		List<User> userList = template.findByExample(user, 0, 1);
//		System.out.println(userList.size());
//		if (userList.isEmpty())
//			return null;	
//		return userList.get(0);
	}
}
