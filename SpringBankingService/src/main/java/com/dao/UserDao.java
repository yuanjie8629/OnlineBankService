package com.dao;

import com.bean.User;

public interface UserDao {
	User login(String username, String password);
}