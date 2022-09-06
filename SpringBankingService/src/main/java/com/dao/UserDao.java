package com.dao;

import com.bean.Customer;
import com.bean.User;

public interface UserDao {
	User login(String username, String password);
	void register(Customer customer);
}