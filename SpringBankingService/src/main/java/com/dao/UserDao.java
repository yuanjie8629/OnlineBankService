package com.dao;

import com.bean.User;

public interface UserDao {
	void update(User user);
	User login(String username, String password);
	boolean checkUsername(String username);
}