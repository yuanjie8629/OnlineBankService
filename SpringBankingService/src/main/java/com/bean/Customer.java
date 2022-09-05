package com.bean;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="customer")
@PrimaryKeyJoinColumn(name="id")
public class Customer extends User{
	private String salutation;
	
	@Column(name="identity_number")
	private String identityNumber;
	
	private String nationality;
	
	private String race;
	
	private String industry;
	
	private String occupation;
	
	private LocalDate birthdate;
	
	@OneToOne(targetEntity=Address.class,cascade=CascadeType.ALL)
	private Address address;
	
	@Column(name="maritalStatus")
	private String maritalStatus;
	
	@OneToMany(mappedBy="customer", cascade = CascadeType.ALL)
	private List<Account> accounts;
	
	@OneToMany(mappedBy="customer")
	private List<CreditCard> creditCards;
}
