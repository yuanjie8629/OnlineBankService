package com.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="account_type")
public class AccountType {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String type;
	
	private String description;
	
	@Lob
	@Column(name = "image", columnDefinition="BLOB")
	private byte[] image;
	
	@Column(name="interest_rate")
	private double interestRate;
	
	@Column(name="min_amount")
	private double minAmount;

	@OneToMany(mappedBy="type", cascade = CascadeType.ALL)
	private List<Account> account;
	
	@Column(name="is_deleted", nullable = false, columnDefinition = "TINYINT(1) default 0")
	private boolean isDeleted;
}
