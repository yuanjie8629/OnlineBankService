package com.bean;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="cust_credit_card")
@PrimaryKeyJoinColumn(name="card_num")  
public class CustCreditCard extends CustCard {
	
	@ManyToOne
	private Customer customer;
	
	@Column(name="avail_amt")
	private double availAmt;
	
	@Column(name="credit_limit")
	private double creditLimit;
	
	@OneToMany(mappedBy="custCreditCard", cascade=CascadeType.ALL)
	private List<CreditCardTransaction> transactions;
	
	@ManyToOne
	@JoinColumn(name="credit_card_id")
	private CreditCard creditCard;
}
