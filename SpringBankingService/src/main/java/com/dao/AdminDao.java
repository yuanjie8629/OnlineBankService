package com.dao;

import com.bean.Admin;

public interface AdminDao {
	void update(Admin admin);
	Admin getAdminById(int id);
}
