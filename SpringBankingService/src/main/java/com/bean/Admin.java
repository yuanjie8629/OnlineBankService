package com.bean;

import javax.persistence.*;

@Entity
@Table(name="admin")
@PrimaryKeyJoinColumn(name="id")
public class Admin extends User{
	private String role;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public Admin() {
		super();
	}

	public Admin(String role) {
		super();
		this.role = role;
	}

	@Override
	public String toString() {
		return super.toString();
	}
}
