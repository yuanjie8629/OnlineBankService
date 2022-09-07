package com.bean;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="account_transaction")
public class AccountTransaction {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String type;
	
	private LocalDateTime date;
	
	private String description;
	
	private double amount;
	
	private double balance;
	
	@ManyToOne(targetEntity=CustAccount.class)
	@JoinColumn(name="acc_num")
	private CustAccount account;
}
