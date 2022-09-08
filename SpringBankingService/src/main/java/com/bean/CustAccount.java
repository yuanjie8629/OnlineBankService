package com.bean;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="cust_account")
public class CustAccount {
	@Id
	@GenericGenerator(name="accNumGenerator", strategy="com.generator.AccountNumGenerator")
	@GeneratedValue(generator="accNumGenerator")
	@Column(name="acc_num")
	private String accNum;
	
	@Column(name="cur_bal")
	private double curBal;
	
	@Column(name="avail_bal")
	private double availBal;
	
	@Column(name="hold_amt")
	private double holdAmt;
	
	
	@Column(name="open_date")
	@CreationTimestamp
	private LocalDateTime openDate;
	
	@Column(name="close_date")
	private LocalDateTime closeDate;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@OneToMany(mappedBy="account", cascade=CascadeType.ALL)
	private List<AccountTransaction> transactions;
	
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;
}
